/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Disasm IDE Entry Point
 */
#include "mainwindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}
