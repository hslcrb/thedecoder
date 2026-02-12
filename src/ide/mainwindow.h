/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Disasm IDE MainWindow Header
 */
#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QProcess>
#include <QStatusBar>
#include <QLabel>
#include <QProgressBar>
#include "../visualizer.h"

class DashboardWidget : public QWidget {
    Q_OBJECT
public:
    explicit DashboardWidget(QWidget *parent = nullptr);
signals:
    void openRequested();
};

class QTextEdit;
class QAction;
class QCheckBox;
class QTabWidget;
class QTreeView;
class QFileSystemModel;

class MainWindow : public QMainWindow
{
    Q_OBJECT
public:
    explicit MainWindow(QWidget *parent = nullptr);

private slots:
    void openBinary();
    void saveAsm();
    void procFinished(int exitCode, QProcess::ExitStatus status);
    void readProcOutput();
    void readProcError();
    void onFileTreeActivated(const QModelIndex &index);
    void closeTab(int index);
    void checkDashboard();

private:
    void addEditorTab(const QString &title, const QString &content, bool isViz = false);
    void loadLargeText(QTextEdit *ed, const QString &content);
    QString detectArch(const QString &path);
    void appendToCurrentTab(const QString &text);
    void startDisassembly(const QString &file, const QString &arch);

    QTabWidget *m_tabs;
    QTreeView *m_tree;
    QFileSystemModel *m_fsModel;
    QAction *m_openAct;
    QAction *m_saveAct;
    QCheckBox *m_intelCheck;
    QProgressBar *m_progressBar;
    QProcess *m_proc;
    QString m_currentAsmPath;
    DashboardWidget *m_dashboard;
    long long m_totalExpectedSize;
    long long m_processedSize;
};

#endif // MAINWINDOW_H
