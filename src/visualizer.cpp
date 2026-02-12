/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Assembly Visualizer Implementation - Parses objdump output
 */
#include "visualizer.h"
#include <sstream>
#include <regex>
#include <iostream>

std::string Visualizer::generateMermaidCFG(const std::string& asmText) {
    std::stringstream ss(asmText);
    std::string line;
    std::string currentFunction = "unknown";
    std::set<Edge> edges;
    std::set<std::string> functions;

    // Regex for function headers: 0000000000001000 <main>:
    std::regex funcRegex(R"([0-9a-fA-F]+\s+<([^>]+)>:)");
    // Regex for jump/call targets: e8 abcdef00  call 2000 <foo> or eb 10 jmp 1027 <main+0x27>
    std::regex targetRegex(R"(<([^>+]+)(?:\+0x[0-9a-fA-F]+)?>)");

    while (std::getline(ss, line)) {
        std::smatch match;
        if (std::regex_search(line, match, funcRegex)) {
            currentFunction = match[1].str();
            functions.insert(currentFunction);
        } else if (currentFunction != "unknown") {
            // Check for jumps and calls
            if (line.find("call") != std::string::npos || 
                line.find("jmp") != std::string::npos ||
                line.find("j") == line.find_first_of("j") && line.find("j") != std::string::npos) {
                
                std::string::const_iterator searchStart(line.c_str());
                while (std::regex_search(searchStart, line.cend(), match, targetRegex)) {
                    std::string target = match[1].str();
                    if (target != currentFunction) {
                        Edge e;
                        e.from = currentFunction;
                        e.to = target;
                        if (line.find("call") != std::string::npos) e.label = "calls";
                        else e.label = "jumps to";
                        edges.insert(e);
                    }
                    searchStart = match[0].second;
                }
            }
        }
    }

    std::stringstream mermaid;
    mermaid << "graph TD\n";
    mermaid << "  %% Monster Grade Analysis / (C) Rheehose 2008-2026\n";
    
    for (const auto& func : functions) {
        mermaid << "  " << func << "[" << func << "]\n";
    }

    for (const auto& edge : edges) {
        mermaid << "  " << edge.from << " -- " << edge.label << " --> " << edge.to << "\n";
    }

    return mermaid.str();
}
