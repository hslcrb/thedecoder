/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Asm Syntax Highlighter Header
 */
#ifndef HIGHLIGHTER_H
#define ASMHIGHLIGHTER_H

#include <QSyntaxHighlighter>
#include <QTextCharFormat>

class QRegularExpression;

class AsmHighlighter : public QSyntaxHighlighter
{
    Q_OBJECT
public:
    explicit AsmHighlighter(QTextDocument *parent = nullptr);

protected:
    void highlightBlock(const QString &text) override;

private:
    struct Rule { QRegularExpression *re; QTextCharFormat fmt; };
    QVector<Rule> m_rules;
};

#endif // ASMHIGHLIGHTER_H
