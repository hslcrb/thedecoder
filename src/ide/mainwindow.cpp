/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Disasm IDE MainWindow Implementation
 */
#include "mainwindow.h"

#include <QPlainTextEdit>
#include <QToolBar>
#include <QAction>
#include <QFileDialog>
#include <QMessageBox>
#include <QProcess>
#include <QCheckBox>
#include <QVBoxLayout>
#include <QFile>
#include <QTextStream>
#include <QScrollBar>
#include <QAbstractTextDocumentLayout>
#include <QTabWidget>
#include <QLabel>
#include <QPushButton>
#include "highlighter.h"
#include <QStatusBar>
#include <QDir>
#include <QPainter>
#include <QTextBlock>
#include <QSettings>
#include "../visualizer.h"
#include "../strings_extractor.h"
#include "../python_rev.h"

/**
 * @brief Simple Dashboard for landing state / 랜딩 상태를 위한 단순 대시보드
 */
class DashboardWidget : public QWidget {
    Q_OBJECT
public:
    DashboardWidget(QWidget *parent = nullptr) : QWidget(parent) {
        QVBoxLayout *layout = new QVBoxLayout(this);
        layout->setAlignment(Qt::AlignCenter);

        QLabel *logo = new QLabel("thedecoder", this);
        logo->setObjectName("logoLabel");
        logo->setStyleSheet("font-size: 56px; font-weight: bold; color: #8ab4f8; margin-bottom: 20px;");
        layout->addWidget(logo);

        QLabel *desc = new QLabel("Monster-Grade Binary Analyzer & Disassembler", this);
        desc->setStyleSheet("font-size: 20px; color: #9aa0a6; margin-bottom: 40px;");
        layout->addWidget(desc);

        QPushButton *openBtn = new QPushButton("Open New Binary", this);
        openBtn->setFixedSize(220, 60);
        openBtn->setStyleSheet(R"(
            QPushButton {
                border-radius: 30px;
                font-size: 18px;
                font-weight: bold;
            }
        )");
        layout->addWidget(openBtn);
        connect(openBtn, &QPushButton::clicked, [this](){ emit openRequested(); });
    }

signals:
    void openRequested();
};

#include "mainwindow.moc" 

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), m_isReadOnly(true)
{
    setWindowTitle("thedecoder - Advanced Binary Analyzer");
    resize(1200, 800);

    // Persistence: Load settings / 지속성: 설정 로드
    QSettings settings("Rheehose", "thedecoder");
    Language lang = static_cast<Language>(settings.value("language", static_cast<int>(Language::KO)).toInt());
    I18n::instance().setLanguage(lang);
    
    m_isDarkMode = settings.value("darkMode", true).toBool();

    m_proc = new QProcess(this);
    m_tabs = new QTabWidget(this);
    m_tabs->setTabsClosable(true);
    connect(m_tabs, &QTabWidget::tabCloseRequested, this, &MainWindow::closeTab);

    m_dashboard = new DashboardWidget(this);
    connect(m_dashboard, &DashboardWidget::openRequested, this, &MainWindow::openBinary);

    QVBoxLayout *mainLayout = new QVBoxLayout();
    mainLayout->setContentsMargins(0, 0, 0, 0);
    mainLayout->addWidget(m_tabs);
    mainLayout->addWidget(m_dashboard);

    QWidget *central = new QWidget(this);
    central->setLayout(mainLayout);
    setCentralWidget(central);

    setupToolbar();
    setupStatusBar();

    checkDashboard();
    applyTheme();
}

void MainWindow::setupToolbar() {
    QToolBar *tb = addToolBar("Main");
    tb->setMovable(false);

    m_openAct = new QAction(I18n::instance().get("open_binary").c_str(), this);
    connect(m_openAct, &QAction::triggered, this, &MainWindow::openBinary);
    tb->addAction(m_openAct);

    m_saveAct = new QAction(I18n::instance().get("save_asm").c_str(), this);
    connect(m_saveAct, &QAction::triggered, this, &MainWindow::saveAsm);
    tb->addAction(m_saveAct);

    m_saveAsAct = new QAction(I18n::instance().get("save_as").c_str(), this);
    connect(m_saveAsAct, &QAction::triggered, this, &MainWindow::saveAs);
    tb->addAction(m_saveAsAct);

    tb->addSeparator();

    m_pythonAct = new QAction(I18n::instance().get("python_rev").c_str(), this);
    connect(m_pythonAct, &QAction::triggered, this, &MainWindow::runPythonRev);
    tb->addAction(m_pythonAct);

    m_interpretedAct = new QAction(I18n::instance().get("interpreted_rev").c_str(), this);
    connect(m_interpretedAct, &QAction::triggered, this, &MainWindow::runInterpretedRev);
    tb->addAction(m_interpretedAct);

    m_stringsAct = new QAction(I18n::instance().get("extract_strings").c_str(), this);
    connect(m_stringsAct, &QAction::triggered, this, &MainWindow::extractStrings);
    tb->addAction(m_stringsAct);

    tb->addSeparator();

    m_langAct = new QAction(I18n::instance().get("lang_toggle").c_str(), this);
    connect(m_langAct, &QAction::triggered, this, &MainWindow::toggleLanguage);
    tb->addAction(m_langAct);

    m_themeAct = new QAction(I18n::instance().get("theme_toggle").c_str(), this);
    connect(m_themeAct, &QAction::triggered, this, &MainWindow::toggleTheme);
    tb->addAction(m_themeAct);

    m_readOnlyAct = new QAction(I18n::instance().get("read_only").c_str(), this);
    m_readOnlyAct->setCheckable(true);
    m_readOnlyAct->setChecked(true);
    connect(m_readOnlyAct, &QAction::triggered, this, &MainWindow::toggleReadOnly);
    tb->addAction(m_readOnlyAct);
}

void MainWindow::setupStatusBar() {
    m_progressBar = new QProgressBar(this);
    m_progressBar->setVisible(false);
    m_progressBar->setMaximumHeight(15);
    statusBar()->addPermanentWidget(m_progressBar);

    connect(m_proc, &QProcess::readyReadStandardOutput, this, &MainWindow::readProcOutput);
    connect(m_proc, &QProcess::readyReadStandardError, this, &MainWindow::readProcError);
    connect(m_proc, QOverload<int, QProcess::ExitStatus>::of(&QProcess::finished), this, &MainWindow::procFinished);

    statusBar()->showMessage(I18n::instance().get("ready").c_str());
}

void MainWindow::updateUiText() {
    setWindowTitle(I18n::instance().get("app_title").c_str());
    m_openAct->setText(I18n::instance().get("open_binary").c_str());
    m_saveAct->setText(I18n::instance().get("save_asm").c_str());
    m_saveAsAct->setText(I18n::instance().get("save_as").c_str());
    m_langAct->setText(I18n::instance().get("lang_toggle").c_str());
    m_themeAct->setText(I18n::instance().get("theme_toggle").c_str());
    m_readOnlyAct->setText(I18n::instance().get("read_only").c_str());
    m_pythonAct->setText(I18n::instance().get("python_rev").c_str());
    m_interpretedAct->setText(I18n::instance().get("interpreted_rev").c_str());
    m_stringsAct->setText(I18n::instance().get("extract_strings").c_str());
    
    if (m_progressBar->isVisible()) {
        statusBar()->showMessage(I18n::instance().get("disassembling").c_str());
    } else if (!m_lastStatusMsg.isEmpty()) {
        statusBar()->showMessage(m_lastStatusMsg);
    } else {
        statusBar()->showMessage(I18n::instance().get("ready").c_str());
    }
}

void MainWindow::toggleLanguage() {
    I18n::instance().toggleLanguage();
    updateUiText();
    
    QSettings settings("Rheehose", "thedecoder");
    settings.setValue("language", static_cast<int>(I18n::instance().currentLanguage()));
}

void MainWindow::toggleTheme() {
    m_isDarkMode = !m_isDarkMode;
    applyTheme();
    
    QSettings settings("Rheehose", "thedecoder");
    settings.setValue("darkMode", m_isDarkMode);
}

void MainWindow::applyTheme() {
    QString qss;
    if (m_isDarkMode) {
        qss = R"(
            QMainWindow, QDialog, DashboardWidget {
                background-color: #1a1a1b;
                color: #e8eaed;
            }
            QTextEdit {
                background-color: #202124;
                color: #e8eaed;
                border: 1px solid #3c4043;
                border-radius: 8px;
            }
            QTabWidget::pane {
                border: 1px solid #3c4043;
                background-color: #1a1a1b;
            }
            QTabBar::tab {
                background: #202124;
                color: #9aa0a6;
                padding: 8px 16px;
            }
            QTabBar::tab:selected {
                background: #1a1a1b;
                color: #8ab4f8;
            }
            QToolBar {
                background-color: #1a1a1b;
                border-bottom: 1px solid #3c4043;
                color: #e8eaed;
            }
            QToolButton {
                color: #e8eaed;
                background-color: transparent;
                border: none;
                padding: 4px;
            }
            QToolButton:hover {
                background-color: #3c4043;
                border-radius: 4px;
            }
            QStatusBar {
                background-color: #1a1a1b;
                color: #9aa0a6;
            }
            QPushButton {
                background-color: #8ab4f8;
                color: #202124;
                border: none;
            }
            QLabel { color: #e8eaed; }
        )";
    } else {
        qss = R"(
            QMainWindow, QDialog, DashboardWidget {
                background-color: #ffffff;
                color: #202124;
            }
            QTextEdit {
                background-color: #ffffff;
                color: #202124;
                border: 1px solid #dadce0;
                border-radius: 8px;
            }
            QTabWidget::pane {
                border: 1px solid #dadce0;
                background-color: #ffffff;
            }
            QTabBar::tab {
                background: #e8eaed;
                color: #5f6368;
                padding: 8px 16px;
            }
            QTabBar::tab:selected {
                background: #ffffff;
                color: #1a73e8;
            }
            QToolBar {
                background-color: #ffffff;
                border-bottom: 1px solid #dadce0;
                color: #202124;
            }
            QToolButton {
                color: #202124;
                background-color: transparent;
                border: none;
                padding: 4px;
            }
            QToolButton:hover {
                background-color: #f1f3f4;
                border-radius: 4px;
            }
            QStatusBar {
                background-color: #f1f3f4;
                color: #5f6368;
            }
            QPushButton {
                background-color: #1a73e8;
                color: #ffffff;
                border: none;
            }
            QLabel { color: #202124; }
        )";
    }
    this->setStyleSheet(qss);
    
    // Update all highlighters in tabs / 탭 내의 모든 하이라이터 업데이트
    for (int i = 0; i < m_tabs->count(); ++i) {
        QWidget *w = m_tabs->widget(i);
        AsmEditor *ed = qobject_cast<AsmEditor*>(w);
        if (ed) {
             // Find highlighter attached to document
             AsmHighlighter *hl = ed->findChild<AsmHighlighter*>();
             if (hl) hl->setDarkMode(m_isDarkMode);
        }
    }
    
    // Update dashboard logo style dynamically / 대시보드 로고 스타일 동적으로 업데이트
    if (m_dashboard) {
        QLabel *logo = m_dashboard->findChild<QLabel*>("logoLabel");
        if (logo) {
            logo->setStyleSheet(m_isDarkMode ? "font-size: 56px; font-weight: bold; color: #8ab4f8;" 
                                             : "font-size: 56px; font-weight: bold; color: #1a73e8;");
        }
    }
}

void MainWindow::toggleReadOnly() {
    m_isReadOnly = m_readOnlyAct->isChecked();
}

void MainWindow::addEditorTab(const QString &title, const QString &content, bool isViz)
{
    AsmEditor *ed = new AsmEditor(this);
    if (!content.isEmpty()) {
        loadLargeText(ed, content);
    }
    
    if (!isViz) {
        AsmHighlighter *hl = new AsmHighlighter(ed->document());
        hl->setParent(ed); // Allow findChild from ed / ed에서 findChild 가능하게 함
        hl->setDarkMode(m_isDarkMode); // Sync initial state / 초기 상태 동기화
    } else {
        ed->setReadOnly(true);
        ed->setStyleSheet("QPlainTextEdit { background-color: #1a1a1b; color: #8ab4f8; font-weight: bold; }");
    }
    int idx = m_tabs->addTab(ed, title);
    m_tabs->setCurrentIndex(idx);
    checkDashboard();
}

void MainWindow::appendToCurrentTab(const QString &text) {
    QWidget *w = m_tabs->currentWidget();
    if (!w) return;
    AsmEditor *ed = qobject_cast<AsmEditor*>(w);
    if (!ed) return;

    if (ed->document()->characterCount() > 5000000) return; 

    ed->moveCursor(QTextCursor::End);
    ed->insertPlainText(text);
}

void MainWindow::readProcOutput() {
    QByteArray data = m_proc->readAllStandardOutput();
    m_processedSize += data.size();
    
    if (m_totalExpectedSize > 0) {
        double progress = (double)m_processedSize / (m_totalExpectedSize * 4.0);
        if (progress > 0.99) progress = 0.99;
        m_progressBar->setValue(progress * 100);
    }

    appendToCurrentTab(QString::fromLocal8Bit(data));
}

void MainWindow::readProcError() {
    QByteArray data = m_proc->readAllStandardError();
    appendToCurrentTab("\n--- stderr ---\n" + QString::fromLocal8Bit(data) + "\n");
}

void MainWindow::loadLargeText(AsmEditor *ed, const QString &content) {
    if (content.length() > 5000000) { 
        ed->setPlainText("--- WARNING: Large Output Truncated for Performance (Original size: " + QString::number(content.size()) + " chars) ---\n" +
                         "Please use 'Save ASM' to view the full content.\n\n" +
                         content.left(1000000));
    } else {
        ed->setPlainText(content);
    }
}

void MainWindow::checkDashboard() {
    bool hasTabs = m_tabs->count() > 0;
    m_tabs->setVisible(hasTabs);
    if (m_dashboard) m_dashboard->setVisible(!hasTabs);
}

void MainWindow::closeTab(int index) {
    m_tabs->removeTab(index);
    checkDashboard();
}

QString MainWindow::detectArch(const QString &path) {
    QProcess p;
    p.start("objdump", QStringList() << "-f" << path);
    if (!p.waitForFinished(2000)) return "unknown";
    QString out = p.readAllStandardOutput();
    if (out.contains("i386:x86-64")) return "x86-64";
    if (out.contains("i386")) return "i386";
    if (out.contains("arm")) return "arm";
    return "unknown";
}

void MainWindow::openBinary()
{
    QString file = QFileDialog::getOpenFileName(this, "Open binary");
    if (file.isEmpty()) return;
    startDisassembly(file, detectArch(file));
}

void MainWindow::startDisassembly(const QString &file, const QString &arch) {
    m_totalExpectedSize = QFileInfo(file).size();
    m_processedSize = 0;
    m_progressBar->setValue(0);
    m_progressBar->setVisible(true);

    QStringList args;
    args << "-d";
    if (arch == "x86-64" || arch == "i386") args << "-Mintel";
    args << file;

    m_currentAsmPath.clear();
    addEditorTab(QFileInfo(file).fileName(), "");
    
    m_proc->start("objdump", args);
    if (!m_proc->waitForStarted(3000)) {
        QMessageBox::critical(this, "Error", "Failed to start objdump.");
        m_progressBar->setVisible(false);
    } else {
        statusBar()->showMessage(I18n::instance().get("disassembling").c_str() + QString(" (") + arch + "): " + file);
    }
}

void MainWindow::procFinished(int exitCode, QProcess::ExitStatus status)
{
    Q_UNUSED(status)
    m_progressBar->setValue(100);
    m_progressBar->setVisible(false);

    QWidget *w = m_tabs->currentWidget();
    if (w) {
        AsmEditor *ed = qobject_cast<AsmEditor*>(w);
        if (ed) {
             QString display = ed->toPlainText();
             std::string mermaid = Visualizer::generateMermaidCFG(display.toStdString());
             addEditorTab(m_tabs->tabText(m_tabs->currentIndex()) + " [Map]", QString::fromStdString(mermaid), true);
        }
    }

    m_lastStatusMsg = QString(I18n::instance().get("saved_to").c_str()) + m_currentAsmPath;
    statusBar()->showMessage(m_lastStatusMsg);
}

void MainWindow::saveAsm()
{
    if (m_currentAsmPath.isEmpty()) {
        saveAs();
        return;
    }
    QWidget *w = m_tabs->currentWidget();
    if (w) {
        AsmEditor *ed = qobject_cast<AsmEditor*>(w);
        if (ed) {
             QFile f(m_currentAsmPath);
             if (f.open(QIODevice::WriteOnly | QIODevice::Text)) {
                 QTextStream os(&f);
                 os << ed->toPlainText();
                 f.close();
                 statusBar()->showMessage(I18n::instance().get("saved_to").c_str() + m_currentAsmPath, 3000);
             }
        }
    }
}

void MainWindow::saveAs() {
    QString fileName = QFileDialog::getSaveFileName(this, "Save As", "", "Assembly Files (*.asm);;All Files (*)");
    if (fileName.isEmpty()) return;
    m_currentAsmPath = fileName;
    saveAsm();
}

void MainWindow::extractStrings() {
    QString fileName = QFileDialog::getOpenFileName(this, "Select File for Strings Extraction");
    if (fileName.isEmpty()) return;
    
    statusBar()->showMessage("Extracting strings...");
    std::string result = StringsExtractor::extract(fileName.toStdString());
    addEditorTab(QFileInfo(fileName).fileName() + " [Strings]", QString::fromStdString(result));
    statusBar()->showMessage(I18n::instance().get("strings_finished").c_str(), 3000);
}

void MainWindow::runPythonRev() {
    QString fileName = QFileDialog::getOpenFileName(this, "Select Python Binary (.exe)", "", "Executable Files (*.exe);;All Files (*)");
    if (fileName.isEmpty()) return;

    statusBar()->showMessage(I18n::instance().get("python_rev").c_str());
    
    std::string result = PythonRev::runFullSequence(fileName.toStdString());
    addEditorTab(QFileInfo(fileName).fileName() + " [PyRev Log]", QString::fromStdString(result));
    
    if (result.find("Successfully extracted") != std::string::npos) {
        statusBar()->showMessage("Extraction successful!", 5000);
    } else {
        statusBar()->showMessage("Extraction failed.", 5000);
    }
}

void MainWindow::runInterpretedRev() {
    QString fileName = QFileDialog::getOpenFileName(this, "Select Script/Binary (JS/Ruby/Go)", "", "All Files (*)");
    if (fileName.isEmpty()) return;

    statusBar()->showMessage(I18n::instance().get("interpreted_rev").c_str());
    addEditorTab(QFileInfo(fileName).fileName() + " [Interpreted]", "# Interpreted Mode Engaged\n# Support for JS/Ruby/High-level Bytecode recovery in progress.\n# Signature: " + QFileInfo(fileName).suffix());
}

// --- AsmEditor Implementation ---

AsmEditor::AsmEditor(QWidget *parent) : QPlainTextEdit(parent) {
    m_lineNumberArea = new LineNumberArea(this);

    connect(this, &QPlainTextEdit::blockCountChanged, this, &AsmEditor::updateLineNumberAreaWidth);
    connect(this, &QPlainTextEdit::updateRequest, this, &AsmEditor::updateLineNumberArea);
    connect(this, &QPlainTextEdit::cursorPositionChanged, [this](){ m_lineNumberArea->update(); });
    connect(this, &QPlainTextEdit::selectionChanged, [this](){ m_lineNumberArea->update(); });

    updateLineNumberAreaWidth(0);
    setLineWrapMode(QPlainTextEdit::NoWrap);
}

int AsmEditor::lineNumberAreaWidth() {
    int digits = 1;
    int max = qMax(1, document()->blockCount());
    while (max >= 10) {
        max /= 10;
        digits++;
    }
    int space = 3 + fontMetrics().horizontalAdvance(QLatin1Char('9')) * digits;
    return space;
}

void AsmEditor::updateLineNumberAreaWidth(int) {
    setViewportMargins(lineNumberAreaWidth(), 0, 0, 0);
}

void AsmEditor::updateLineNumberArea(const QRect &rect, int dy) {
    if (dy) m_lineNumberArea->scroll(0, dy);
    else m_lineNumberArea->update(0, rect.y(), m_lineNumberArea->width(), rect.height());
    if (rect.contains(viewport()->rect())) updateLineNumberAreaWidth(0);
}

void AsmEditor::resizeEvent(QResizeEvent *e) {
    QPlainTextEdit::resizeEvent(e);
    QRect cr = contentsRect();
    m_lineNumberArea->setGeometry(QRect(cr.left(), cr.top(), lineNumberAreaWidth(), cr.height()));
}

void AsmEditor::lineNumberAreaPaintEvent(QPaintEvent *event) {
    QPainter painter(m_lineNumberArea);
    painter.fillRect(event->rect(), QColor("#2b2b2b"));

    QTextBlock block = firstVisibleBlock();
    int blockNumber = block.blockNumber();
    int top = (int)blockBoundingGeometry(block).translated(contentOffset()).top();
    int bottom = top + (int)blockBoundingRect(block).height();

    while (block.isValid() && top <= event->rect().bottom()) {
        if (block.isVisible() && bottom >= event->rect().top()) {
            QString number = QString::number(blockNumber + 1);
            painter.setPen(QColor("#858585"));
            painter.drawText(0, top, m_lineNumberArea->width() - 2, fontMetrics().height(), Qt::AlignRight, number);
        }
        block = block.next();
        top = bottom;
        bottom = top + (int)blockBoundingRect(block).height();
        ++blockNumber;
    }
}

void AsmEditor::keyPressEvent(QKeyEvent *e) {
    QPlainTextEdit::keyPressEvent(e);
}
