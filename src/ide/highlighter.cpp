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
    setupRules(true); // Default to dark / 기본값 다크
}

void AsmHighlighter::setDarkMode(bool dark) {
    setupRules(dark);
    rehighlight();
}

void AsmHighlighter::setupRules(bool dark) {
    m_rules.clear();

    // Palette Colors / 팔레트 색상
    QString addrCol = dark ? "#f28b82" : "#c5221f"; // Deep red in light / 라이트 모드에선 깊은 빨강
    QString opCol   = dark ? "#8ab4f8" : "#1a73e8"; // Vivid blue in light / 라이트 모드에선 선명한 파랑
    QString regCol  = dark ? "#aecbfa" : "#185abc"; // Darker blue for reg in light / 라이트 모드에선 더 짙은 파랑
    QString hexCol  = dark ? "#fdd663" : "#e37400"; // Orange/Dark yellow in light / 라이트 모드에선 오렌지/짙은 노랑

    // addresses / 주소
    {
        Rule r;
        r.re = new QRegularExpression("\\b[0-9a-fA-F]{4,16}\\b");
        r.fmt.setForeground(QColor(addrCol));
        r.fmt.setFontWeight(QFont::Bold);
        m_rules.append(r);
    }

    // opcodes / mnemonics / 옵코드/니모닉
    {
        Rule r;
        r.re = new QRegularExpression("\\b(mov|movzx|movsx|add|sub|jmp|call|ret|push|pop|cmp|jne|je|jz|jnz|lea|xor|and|or|inc|dec|test|nop|syscall|int|leave|nop|short|long|ptr|byte|word|dword|qword|offset|setz|setnz|clc|stc|std|cld|loop|rep|movsb|movsw|movsd|movsq|scasb|scasw|scasd|scasq|extras|xchg|xadd|cmpxchg|cmova|cmovae|cmovb|cmovbe|cmovc|cmove|cmovg|cmovge|cmovl|cmovle|cmovna|cmovnae|cmovnb|cmovnbe|cmovnc|cmovne|cmovng|cmovnge|cmovnl|cmovnle|cmovno|cmovnp|cmovns|cmovnz|cmovo|cmovp|cmovpe|cmovpo|cmovs|cmovz)\\b",
                                      QRegularExpression::CaseInsensitiveOption);
        r.fmt.setForeground(QColor(opCol));
        r.fmt.setFontWeight(QFont::Bold);
        m_rules.append(r);
    }

    // Registers / 레지스터
    {
        Rule r;
        r.re = new QRegularExpression("\\b(rax|rbx|rcx|rdx|rsi|rdi|rbp|rsp|r8|r9|r10|r11|r12|r13|r14|r15|eax|ebx|ecx|edx|esi|edi|ebp|esp|ax|bx|cx|dx|si|di|bp|sp|al|bl|cl|dl|ah|bh|ch|dh|rip|eip|ip|cs|ds|es|fs|gs|ss|cr0|cr2|cr3|cr4|dr0|dr1|dr2|dr3|dr6|dr7|st0|st1|st2|st3|st4|st5|st6|st7|mm0|mm1|mm2|mm3|mm4|mm5|mm6|mm7|xmm0|xmm1|xmm2|xmm3|xmm4|xmm5|xmm6|xmm7|xmm8|xmm9|xmm10|xmm11|xmm12|xmm13|xmm14|xmm15|ymm0|ymm1|ymm2|ymm3|ymm4|ymm5|ymm6|ymm7|ymm8|ymm9|ymm10|ymm11|ymm12|ymm13|ymm14|ymm15|zmm0|zmm1|zmm2|zmm3|zmm4|zmm5|zmm6|zmm7|zmm8|zmm9|zmm10|zmm11|zmm12|zmm13|zmm14|zmm15)\\b",
                                      QRegularExpression::CaseInsensitiveOption);
        r.fmt.setForeground(QColor(regCol));
        r.fmt.setFontWeight(QFont::Bold);
        m_rules.append(r);
    }

    // hex bytes / 16진수 바이트
    {
        Rule r;
        r.re = new QRegularExpression("\\b[0-9a-fA-F]{2}(?: [0-9a-fA-F]{2})*\\b");
        r.fmt.setForeground(QColor(hexCol));
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
