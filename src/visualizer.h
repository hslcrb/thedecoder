/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Assembly Visualizer Header - Generates Mermaid CFG
 */
#ifndef VISUALIZER_H
#define VISUALIZER_H

#include <string>
#include <vector>
#include <set>
#include <map>

class Visualizer {
public:
    /**
     * Generates a Mermaid.js string representing the Control Flow Graph (CFG)
     * of the provided assembly text.
     */
    static std::string generateMermaidCFG(const std::string& asmText);

private:
    struct Edge {
        std::string from;
        std::string to;
        std::string label;
        bool operator<(const Edge& other) const {
            if (from != other.from) return from < other.from;
            if (to != other.to) return to < other.to;
            return label < other.label;
        }
    };
};

#endif
