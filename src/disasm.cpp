/*
 * (C) Rheehose (Rhee Creative) 2008-2026
 * Simple Disassembler Wrapper
 */
#include <bits/stdc++.h>
#include <cstdio>
#include "visualizer.h"

int main(int argc, char** argv) {
    if (argc < 2) {
        std::cerr << "Usage: disasm <binary> [-o output.asm] [--intel]\n";
        return 1;
    }

    std::string infile;
    std::string outfile;
    bool intel = false;
    bool graph = false;

    infile = argv[1];
    for (int i = 2; i < argc; ++i) {
        std::string a = argv[i];
        if (a == "-o" && i + 1 < argc) {
            outfile = argv[++i];
        } else if (a == "--intel") {
            intel = true;
        } else if (a == "--graph") {
            graph = true;
        } else if (a == "-h" || a == "--help") {
            std::cout << "Usage: disasm <binary> [-o output.asm] [--intel] [--graph]\n";
            std::cout << "Options:\n";
            std::cout << "  -o FILE    Output file path (default: <input>.asm)\n";
            std::cout << "  --intel    Use Intel syntax for disassembly\n";
            std::cout << "  --graph    Generate Mermaid CFG graph (.md)\n";
            return 0;
        } else {
            std::cerr << "Unknown option: " << a << "\n";
            return 1;
        }
    }

    if (outfile.empty()) {
        outfile = infile + ".asm";
    }

    // Build objdump command
    std::string cmd = "objdump -d ";
    if (intel) cmd += "-Mintel ";
    cmd += '"' + infile + '"';

    FILE* pipe = popen(cmd.c_str(), "r");
    if (!pipe) {
        std::cerr << "Failed to run objdump. Make sure objdump (binutils) is installed.\n";
        return 2;
    }

    std::ofstream ofs(outfile, std::ios::out | std::ios::binary);
    if (!ofs) {
        std::cerr << "Failed to open output file: " << outfile << "\n";
        pclose(pipe);
        return 3;
    }

    char buf[4096];
    while (fgets(buf, sizeof(buf), pipe)) {
        ofs << buf;
    }

    int status = pclose(pipe);
    if (status != 0) {
        std::cerr << "objdump exited with status: " << status << " (this may still have produced output)\n";
    }

    std::cout << "Wrote assembly to: " << outfile << "\n";

    if (graph) {
        std::ifstream ifs(outfile, std::ios::in | std::ios::binary);
        std::string content((std::istreambuf_iterator<char>(ifs)), (std::istreambuf_iterator<char>()));
        std::string mermaid = Visualizer::generateMermaidCFG(content);
        std::string graphFile = outfile + ".map.md";
        std::ofstream gofs(graphFile);
        gofs << "```mermaid\n" << mermaid << "```\n";
        std::cout << "Wrote Mermaid graph to: " << graphFile << "\n";
    }

    return 0;
}
