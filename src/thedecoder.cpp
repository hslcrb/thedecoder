#include <bits/stdc++.h>
#include <cstdio>
#include <sys/stat.h>
#include <unistd.h>
#include "visualizer.h"
#include "i18n.h"

/**
 * @brief thedecoder: Monster Grade Binary Analyzer (CLI)
 * Rheehose (Rhee Creative) 2008-2026
 * Apache 2.0 License
 */

void print_logo() {
    std::cout << "\033[1;36m";
    std::cout << "  _   _              _                     _           \n";
    std::cout << " | |_| |__   ___  __| | ___  ___ ___   __| | ___ _ __ \n";
    std::cout << " | __| '_ \\ / _ \\/ _` |/ _ \\/ __/ _ \\ / _` |/ _ \\ '__|\n";
    std::cout << " | |_| | | |  __/ (_| |  __/ (_| (_) | (_| |  __/ |   \n";
    std::cout << "  \\__|_| |_|\\___|\\__,_|\\___|\\___\\___/ \\__,_|\\___|_|   \n";
    std::cout << "\033[0m";
    std::cout << "         --- " << I18n::instance().get("app_title") << " ---\n";
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
    std::string infile;
    std::string outfile;
    bool intel = false;
    bool graph = false;

    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg == "/lang") {
            I18n::instance().toggleLanguage();
            std::cout << "Language changed / 언어 변경됨: " << I18n::instance().get("lang_toggle") << std::endl;
            if (argc == 2) return 0; // Just toggling / 그냥 전환만 함
            continue;
        }
        
        if (arg == "-h" || arg == "--help") {
            std::cout << I18n::instance().get("cli_usage") << std::endl;
            std::cout << "Options:" << std::endl;
            std::cout << "  -o <file>   Output filename" << std::endl;
            std::cout << "  --intel     Use Intel syntax" << std::endl;
            std::cout << "  --graph     Generate Mermaid CFG" << std::endl;
            std::cout << "  /lang       " << I18n::instance().get("cli_lang_cmd") << std::endl;
            return 0;
        } else {
            std::cerr << I18n::instance().get("unknown_option") << ": " << arg << "\n";
            return 1;
        }
    }

    if (infile.empty()) {
        std::cout << I18n::instance().get("cli_usage") << std::endl;
        std::cout << "Options:" << std::endl;
        std::cout << "  -o <file>   Output filename" << std::endl;
        std::cout << "  --intel     Use Intel syntax" << std::endl;
        std::cout << "  --graph     Generate Mermaid CFG" << std::endl;
        std::cout << "  /lang       " << I18n::instance().get("cli_lang_cmd") << std::endl;
        return 1;
    }

    print_logo();

    if (outfile.empty()) {
        outfile = infile + ".asm";
    }

    struct stat st;
    if (stat(infile.c_str(), &st) != 0) {
        std::cerr << I18n::instance().get("error_file_not_found") << ": " << infile << "\n";
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
        std::cerr << I18n::instance().get("error_objdump_failed") << "\n";
        return 2;
    }

    std::ofstream ofs(outfile, std::ios::out | std::ios::binary);
    if (!ofs) {
        std::cerr << I18n::instance().get("error_output_file_failed") << ": " << outfile << "\n";
        pclose(pipe);
        return 3;
    }

    std::cout << I18n::instance().get("analyzing") << ": " << infile << " (" << (total_size / 1024) << " KB)\n";

    std::string line;
    long long total_processed = 0;
    // Wrap FILE* pipe in an istream for easier line reading
    // This is a simplified approach; a proper Popen class would be better
    char buf[8192];
    std::string pipe_output_buffer;
    while (fgets(buf, sizeof(buf), pipe)) {
        pipe_output_buffer += buf;
    }
    std::istringstream pipe_stream(pipe_output_buffer);

    long long file_size = total_size; // Use original file size for progress estimation base
    while (std::getline(pipe_stream, line)) {
        ofs << line << "\n";
        total_processed += line.size();
        double progress = (double)total_processed / (file_size * 5.0); // Rough estimate
        if (progress > 0.99) progress = 0.99;
        print_progress(progress);
    }
    pclose(pipe);
    print_progress(1.0);
    std::cout << std::endl;

    int status = pclose(pipe); // This pclose is redundant if the previous one is kept
    if (status != 0) {
        std::cerr << I18n::instance().get("note_objdump_status") << ": " << status << "\n";
    }

    std::cout << "\033[1;32m[+] " << I18n::instance().get("finished") << ": " << outfile << "\033[0m" << std::endl;
    std::cout << "[*] " << I18n::instance().get("saved_to") << outfile << std::endl;

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
