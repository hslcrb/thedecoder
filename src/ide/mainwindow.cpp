/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Disasm IDE MainWindow Implementation
 */
#include "mainwindow.h"

#include <QTextEdit>
#include <QToolBar>
#include <QAction>
#include <QFileDialog>
#include <QMessageBox>
#include <QProcess>
#include <QCheckBox>
#include <QVBoxLayout>
#include <QFile>
#include <QTextStream>
#include <QTabWidget>
#include <QTreeView>
#include <QFileSystemModel>
#include <QDockWidget>
#include "highlighter.h"
#include <QStatusBar>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), m_proc(new QProcess(this))
{
    setWindowTitle("Disasm IDE");
    resize(1100, 700);

    m_tabs = new QTabWidget(this);
    m_tabs->setTabsClosable(true);
    setCentralWidget(m_tabs);

    // File tree dock
    m_fsModel = new QFileSystemModel(this);
    m_fsModel->setRootPath(QDir::homePath());
    m_tree = new QTreeView(this);
    m_tree->setModel(m_fsModel);
    m_tree->setRootIndex(m_fsModel->index(QDir::homePath()));
    m_tree->setHeaderHidden(false);
    QDockWidget *dock = new QDockWidget("Files", this);
    dock->setWidget(m_tree);
    addDockWidget(Qt::LeftDockWidgetArea, dock);

    connect(m_tree, &QTreeView::activated, this, &MainWindow::onFileTreeActivated);

    QToolBar *tb = addToolBar("Main");
    m_openAct = tb->addAction("Open Binary");
    connect(m_openAct, &QAction::triggered, this, &MainWindow::openBinary);

    m_saveAct = tb->addAction("Save ASM");
    connect(m_saveAct, &QAction::triggered, this, &MainWindow::saveAsm);

    m_intelCheck = new QCheckBox("Intel syntax", this);
    tb->addWidget(m_intelCheck);

    connect(m_proc, QOverload<int, QProcess::ExitStatus>::of(&QProcess::finished), this, &MainWindow::procFinished);

    statusBar()->showMessage("Ready");

    // Premium Dark Theme - Samsung Notes inspired / 프리미엄 다크 테마 - 삼성 노트 스타일
    QString qss = R"(
        QMainWindow, QDialog {
            background-color: #1a1a1b;
            color: #e8eaed;
        }
        QTextEdit {
            background-color: #202124;
            color: #e8eaed;
            border: 1px solid #3c4043;
            border-radius: 8px;
            font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
            font-size: 14px;
            padding: 10px;
        }
        QTabWidget::pane {
            border: 1px solid #3c4043;
            background-color: #1a1a1b;
        }
        QTabBar::tab {
            background: #202124;
            color: #9aa0a6;
            padding: 8px 16px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            margin-right: 2px;
        }
        QTabBar::tab:selected {
            background: #1a1a1b;
            color: #8ab4f8;
            border-bottom: 2px solid #8ab4f8;
        }
        QTreeView {
            background-color: #1a1a1b;
            color: #e8eaed;
            border: none;
        }
        QTreeView::item:hover {
            background-color: #2d2e30;
        }
        QTreeView::item:selected {
            background-color: #313235;
            color: #8ab4f8;
        }
        QToolBar {
            background-color: #1a1a1b;
            border-bottom: 1px solid #3c4043;
            spacing: 10px;
            padding: 5px;
        }
        QCheckBox {
            color: #e8eaed;
        }
        QStatusBar {
            background-color: #1a1a1b;
            color: #9aa0a6;
            border-top: 1px solid #3c4043;
        }
        QHeaderView::section {
            background-color: #202124;
            color: #9aa0a6;
            border: 1px solid #3c4043;
            padding: 4px;
        }
    )";
    this->setStyleSheet(qss);
}

void MainWindow::addEditorTab(const QString &title, const QString &content)
{
    QTextEdit *ed = new QTextEdit(this);
    ed->setPlainText(content);
    AsmHighlighter *hl = new AsmHighlighter(ed->document());
    Q_UNUSED(hl);
    int idx = m_tabs->addTab(ed, title);
    m_tabs->setCurrentIndex(idx);
}

void MainWindow::openBinary()
{
    QString file = QFileDialog::getOpenFileName(this, "Open binary");
    if (file.isEmpty()) return;

    QStringList args;
    args << "-d";
    if (m_intelCheck->isChecked()) args << "-Mintel";
    args << file;

    m_currentAsmPath.clear();
    m_proc->start("objdump", args);
    if (!m_proc->waitForStarted(3000)) {
        QMessageBox::critical(this, "Error", "Failed to start objdump. Ensure binutils is installed and in your PATH.\nError: " + m_proc->errorString());
        statusBar()->showMessage("Error: Failed to start objdump");
    } else {
        statusBar()->showMessage("Disassembling: " + file);
    }
}

void MainWindow::procFinished(int exitCode, QProcess::ExitStatus status)
{
    Q_UNUSED(status)
    QByteArray out = m_proc->readAllStandardOutput();
    QByteArray err = m_proc->readAllStandardError();
    QString display;
    if (!err.isEmpty()) {
        display += "--- stderr ---\n" + QString::fromLocal8Bit(err) + "\n";
    }
    display += QString::fromLocal8Bit(out);

    // create new tab with assembly
    QString title = "disasm";
    QStringList args = m_proc->arguments();
    if (!args.isEmpty()) {
        QString bin = args.last();
        title = QFileInfo(bin).fileName();
        m_currentAsmPath = bin + ".asm";
    }
    addEditorTab(title, display);

    statusBar()->showMessage("Disassembly finished", 3000);

    if (exitCode != 0) {
        QMessageBox::warning(this, "objdump", "objdump exited with code " + QString::number(exitCode));
    }
}

void MainWindow::onFileTreeActivated(const QModelIndex &index)
{
    if (!m_fsModel) return;
    QString path = m_fsModel->filePath(index);
    if (QFileInfo(path).isDir()) return;
    // If file is an executable/binary, run disasm; otherwise open as text
    QFile f(path);
    if (!f.open(QIODevice::ReadOnly)) return;
    QByteArray header = f.read(4);
    f.close();
    bool isBin = false;
    if (header.size() >= 4) {
        isBin = (static_cast<unsigned char>(header[0]) == 0x7f && header[1] == 'E' && header[2] == 'L' && header[3] == 'F');
    }
    if (!isBin && header.size() >= 2) {
        isBin = (header[0] == 'M' && header[1] == 'Z');
    }

    if (isBin) {
        QStringList args;
        args << "-d";
        if (m_intelCheck->isChecked()) args << "-Mintel";
        args << path;
        m_proc->start("objdump", args);
    } else {
        if (!f.open(QIODevice::ReadOnly | QIODevice::Text)) return;
        QString content = QString::fromLocal8Bit(f.readAll());
        addEditorTab(QFileInfo(path).fileName(), content);
    }
}

void MainWindow::saveAsm()
{
    QWidget *w = m_tabs->currentWidget();
    if (!w) return;
    QTextEdit *ed = qobject_cast<QTextEdit*>(w);
    if (!ed) return;

    QString path = QFileDialog::getSaveFileName(this, "Save assembly", m_currentAsmPath.isEmpty() ? QStringLiteral("output.asm") : m_currentAsmPath);
    if (path.isEmpty()) return;

    QFile f(path);
    if (!f.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        QMessageBox::critical(this, "Save Error", "Failed to open file for writing: " + path);
        return;
    }
    QTextStream ts(&f);
    ts << ed->toPlainText();
    f.close();
    QMessageBox::information(this, "Saved", "Saved assembly to: " + path);
}
