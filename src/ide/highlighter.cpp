/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Asm Syntax Highlighter Implementation
 */
#include "highlighter.h"
#include <QRegularExpression>
#include <QTextDocument>

AsmHighlighter::AsmHighlighter(QTextDocument *parent)
    : QSyntaxHighlighter(parent)
{
    // addresses / 주소
    {
        Rule r;
        r.re = new QRegularExpression("\\b[0-9a-fA-F]{4,16}\\b");
        r.fmt.setForeground(QColor("#f28b82")); // Soft red / 연한 빨강
        r.fmt.setFontWeight(QFont::Bold);
        m_rules.append(r);
    }

    // opcodes / mnemonics / 옵코드/니모닉
    {
        Rule r;
        r.re = new QRegularExpression("\\b(mov|add|sub|jmp|call|ret|push|pop|cmp|jne|je|jz|jnz|lea|xor|and|or|inc|dec|test|nop|syscall|int|leave|nop|short|long|ptr)\\b",
                                      QRegularExpression::CaseInsensitiveOption);
        r.fmt.setForeground(QColor("#8ab4f8")); // Soft blue / 연한 파랑
        r.fmt.setFontWeight(QFont::Bold);
        m_rules.append(r);
    }

    // Registers / 레지스터
    {
        Rule r;
        r.re = new QRegularExpression("\\b(rax|rbx|rcx|rdx|rsi|rdi|rbp|rsp|r8|r9|r10|r11|r12|r13|r14|r15|eax|ebx|ecx|edx|esi|edi|ebp|esp|ax|bx|cx|dx|si|di|bp|sp|ah|al|bh|bl|ch|cl|dh|dl)\\b",
                                      QRegularExpression::CaseInsensitiveOption);
        r.fmt.setForeground(QColor("#81c995")); // Soft green / 연한 녹색
        r.fmt.setFontWeight(QFont::Bold);
        m_rules.append(r);
    }

    // hex bytes / 16진수 바이트
    {
        Rule r;
        r.re = new QRegularExpression("\\b[0-9a-fA-F]{2}(?: [0-9a-fA-F]{2})*\\b");
        r.fmt.setForeground(QColor("#fdd663")); // Soft yellow / 연한 노랑
        m_rules.append(r);
    }
}

void AsmHighlighter::highlightBlock(const QString &text)
{
    for (const Rule &r : qAsConst(m_rules)) {
        QRegularExpressionMatchIterator it = r.re->globalMatch(text);
        while (it.hasNext()) {
            QRegularExpressionMatch m = it.next();
            setFormat(m.capturedStart(), m.capturedLength(), r.fmt);
        }
    }
}
