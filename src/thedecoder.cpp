#include <bits/stdc++.h>
#include <cstdio>
#include <sys/stat.h>
#include <unistd.h>
#include "visualizer.h"

void print_logo() {
    std::cout << "\033[1;36m";
    std::cout << "  _   _              _                     _           \n";
    std::cout << " | |_| |__   ___  __| | ___  ___ ___   __| | ___ _ __ \n";
    std::cout << " | __| '_ \\ / _ \\/ _` |/ _ \\/ __/ _ \\ / _` |/ _ \\ '__|\n";
    std::cout << " | |_| | | |  __/ (_| |  __/ (_| (_) | (_| |  __/ |   \n";
    std::cout << "  \\__|_| |_|\\___|\\__,_|\\___|\\___\\___/ \\__,_|\\___|_|   \n";
    std::cout << "\033[0m";
    std::cout << "         --- Beyond Perfection, Monster Grade ---\n\n";
}

void print_progress(double percentage) {
    int width = 50;
    std::cout << "\r[";
    int pos = width * percentage;
    for (int i = 0; i < width; ++i) {
        if (i < pos) std::cout << "=";
        else if (i == pos) std::cout << ">";
        else std::cout << " ";
    }
    std::cout << "] " << int(percentage * 100.0) << "% " << std::flush;
}

std::string clean_path(std::string path) {
    if (path.empty()) return path;
    if ((path.front() == '"' && path.back() == '"') || (path.front() == '\'' && path.back() == '\'')) {
        path = path.substr(1, path.size() - 2);
    }
    // Simple normalization: convert \ to / for internal use if needed, but here we just keep it
    return path;
}

int main(int argc, char** argv) {
    if (argc < 2) {
        std::cerr << "Usage: thedecoder <binary> [-o output.asm] [--intel]\n";
        return 1;
    }

    std::string infile;
    std::string outfile;
    bool intel = false;
    bool graph = false;

    infile = clean_path(argv[1]);
    for (int i = 2; i < argc; ++i) {
        std::string a = argv[i];
        if (a == "-o" && i + 1 < argc) {
            outfile = clean_path(argv[++i]);
        } else if (a == "--intel") {
            intel = true;
        } else if (a == "--graph") {
            graph = true;
        } else if (a == "-h" || a == "--help") {
            std::cout << "Usage: thedecoder <binary> [-o output.asm] [--intel] [--graph]\n";
            std::cout << "Options:\n";
            std::cout << "  -o FILE    Output file path (default: <input>.asm in same dir)\n";
            std::cout << "  --intel    Use Intel syntax (Auto-detected for x86)\n";
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

    struct stat st;
    if (stat(infile.c_str(), &st) != 0) {
        std::cerr << "Error: Cannot find input file: " << infile << "\n";
        return 1;
    }
    long long total_size = st.st_size;

    // Auto-detect architecture / 아키텍처 자동 탐지
    std::string arch_cmd = "objdump -f " + infile + " 2>/dev/null";
    FILE* arch_pipe = popen(arch_cmd.c_str(), "r");
    bool is_x86_64 = true; // semi-default
    if (arch_pipe) {
        char arch_buf[512];
        while (fgets(arch_buf, sizeof(arch_buf), arch_pipe)) {
            std::string line = arch_buf;
            if (line.find("i386:x86-64") != std::string::npos) is_x86_64 = true;
            else if (line.find("i386") != std::string::npos && line.find("x86-64") == std::string::npos) is_x86_64 = false;
        }
        pclose(arch_pipe);
    }

    // Build objdump command
    std::string cmd = "objdump -d ";
    if (is_x86_64 && intel) cmd += "-Mintel ";
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

    std::cout << "Analyzing: " << infile << " (" << (total_size / 1024) << " KB)\n";

    char buf[8192];
    long long processed = 0;
    while (fgets(buf, sizeof(buf), pipe)) {
        std::string line = buf;
        ofs << line;
        
        // Highly simplified progress estimation based on output lines/content
        // objdump output is usually larger than original binary, we approximate
        processed += line.size();
        double progress = (double)processed / (total_size * 3.0); // Rough factor for objdump expansion
        if (progress > 0.99) progress = 0.99;
        print_progress(progress);
    }
    print_progress(1.0);
    std::cout << "\n";

    int status = pclose(pipe);
    if (status != 0) {
        std::cerr << "Note: objdump finished with status: " << status << "\n";
    }

    std::cout << "\033[1;32mDONE!\033[0m Results saved to: " << outfile << "\n";

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
