/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Disasm IDE MainWindow Header
 */
#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QProcess>

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
    void onFileTreeActivated(const QModelIndex &index);

private:
    void addEditorTab(const QString &title, const QString &content, bool isViz = false);

    QTabWidget *m_tabs;
    QTreeView *m_tree;
    QFileSystemModel *m_fsModel;

    QProcess *m_proc;
    QAction *m_openAct;
    QAction *m_saveAct;
    QCheckBox *m_intelCheck;
    QString m_currentAsmPath;
};

#endif // MAINWINDOW_H
