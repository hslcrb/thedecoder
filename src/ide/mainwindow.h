/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Disasm IDE MainWindow Header
 */
#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTextEdit>
#include <QTabWidget>
#include <QHeaderView>
#include <QFileDialog>
#include <QMessageBox>
#include <QProcess>
#include <QFileInfo>
#include <QAction>
#include <QToolBar>
#include <QStatusBar>
#include <QLabel>
#include <QProgressBar>
#include <QCheckBox>
#include <QPainter>
#include <QTextBlock>
#include "../i18n.h"
#include "../visualizer.h"

class DashboardWidget;

/**
 * @brief Custom Text Editor with Line Numbers / 행 번호가 포함된 커스텀 텍스트 에디터
 */
class AsmEditor : public QTextEdit {
    Q_OBJECT
public:
    AsmEditor(QWidget *parent = nullptr);
    void lineNumberAreaPaintEvent(QPaintEvent *event);
    int lineNumberAreaWidth();

protected:
    void resizeEvent(QResizeEvent *event) override;
    void keyPressEvent(QKeyEvent *e) override;

private slots:
    void updateLineNumberAreaWidth(int newBlockCount);
    void updateLineNumberArea(const QRect &rect, int dy);

private:
    QWidget *m_lineNumberArea;
};

class LineNumberArea : public QWidget {
public:
    LineNumberArea(AsmEditor *editor) : QWidget(editor), m_editor(editor) {}
    QSize sizeHint() const override { return QSize(m_editor->lineNumberAreaWidth(), 0); }

protected:
    void paintEvent(QPaintEvent *event) override { m_editor->lineNumberAreaPaintEvent(event); }

private:
    AsmEditor *m_editor;
};

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow() = default;

private slots:
    void openBinary();
    void saveAsm();
    void saveAs();         // New: Save As / 새 기능: 다른 이름으로 저장
    void toggleLanguage(); // New: Language Toggle / 새 기능: 언어 전환
    void toggleReadOnly(); // New: Read-Only Toggle / 새 기능: 읽기 전용 토글
    void extractStrings(); // New: Strings Extraction / 새 기능: 문자열 추출
    void runPythonRev();   // New: Python Reversing / 새 기능: 파이썬 리버싱
    void procFinished(int exitCode, QProcess::ExitStatus status);
    void readProcOutput();
    void readProcError();
    void closeTab(int index);
    void checkDashboard();

private:
    void setupToolbar();
    void setupStatusBar();
    void addEditorTab(const QString &title, const QString &content, bool isViz = false);
    void loadLargeText(AsmEditor *ed, const QString &content);
    QString detectArch(const QString &path);
    void appendToCurrentTab(const QString &text);
    void startDisassembly(const QString &file, const QString &arch);
    void updateUiText(); // Helper to refresh KR/EN labels / KR/EN 레이블 새로고침 헬퍼

    QTabWidget *m_tabs;
    QAction *m_openAct;
    QAction *m_saveAct;
    QAction *m_saveAsAct;
    QAction *m_langAct;
    QAction *m_readOnlyAct;
    QAction *m_stringsAct;
    QAction *m_pythonAct;
    QProgressBar *m_progressBar;
    QString m_lastStatusMsg; // Persistence for status / 상태 유지를 위한 메시지
    QProcess *m_proc;
    QString m_currentAsmPath;
    DashboardWidget *m_dashboard;
    long long m_totalExpectedSize;
    long long m_processedSize;
    bool m_isReadOnly;

    friend class AsmEditor; // For accessing m_readOnlyAct / m_readOnlyAct 접근용
};

#endif // MAINWINDOW_H
