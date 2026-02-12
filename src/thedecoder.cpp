#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <sstream>
#include <algorithm>
#include <map>
#include <cstdio>
#include <sys/stat.h>
#include <unistd.h>
#include <wordexp.h>
#include "visualizer.h"
#include "i18n.h"
#include "strings_extractor.h"
#include "python_rev.h"

// Constants / 상수
const char* CONFIG_FILE = "~/.thedecoder_rc";

std::string get_config_path() {
    wordexp_t exp_result;
    wordexp(CONFIG_FILE, &exp_result, 0);
    std::string path = exp_result.we_wordv[0];
    wordfree(&exp_result);
    return path;
}

void load_settings() {
    std::ifstream in(get_config_path());
    if (!in.is_open()) return;
    std::string key, val;
    while (in >> key >> val) {
        if (key == "lang") {
            if (val == "EN") I18n::instance().setLanguage(Language::EN);
            else I18n::instance().setLanguage(Language::KO);
        }
    }
}

void save_settings() {
    std::ofstream out(get_config_path());
    out << "lang " << (I18n::instance().currentLanguage() == Language::EN ? "EN" : "KO") << std::endl;
}

/**
 * @brief thedecoder: Monster Grade Binary Analyzer (CLI)
 * Rheehose (Rhee Creative) 2008-2026
 */

std::string clean_path(const std::string& p) {
    if (p.front() == '\'' && p.back() == '\'') return p.substr(1, p.length() - 2);
    return p;
}

void print_logo() {
    std::cout << "\033[1;36m";
    std::cout << "  _   _              _                     _           \n";
    std::cout << " | |_| |__   ___  __| | ___  ___ ___   __| | ___ _ __ \n";
    std::cout << " | __| '_ \\ / _ \\/ _` |/ _ \\/ __/ _ \\ / _` |/ _ \\ '__|\n";
    std::cout << " | |_| | | |  __/ (_| |  __/ (_| (_) | (_| |  __/ |   \n";
    std::cout << "  \\__|_| |_|\\___|\\__,_|\\___|\\__\\___/ \\__,_|\\___|_|   \n";
    std::cout << "\033[0m";
    std::cout << "         --- " << I18n::instance().get("app_title") << " ---\n";
    std::cout << "         --- Beyond Perfection, Monster Grade ---\n\n";
}

int main(int argc, char** argv) {
    load_settings();
    std::string infile;
    std::string outfile = "output.asm";
    bool intel = false;
    bool graph = false;

    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg == "/lang") {
            I18n::instance().toggleLanguage();
            save_settings();
            std::cout << "Language changed / 언어 변경됨: " << I18n::instance().get("lang_toggle") << std::endl;
            if (argc == 2) return 0; // Just toggling / 그냥 전환만 함
            continue;
        }

        if (arg == "/theme") {
            // CLI Theme simply toggles between light/dark-friendly colors
            std::cout << "Theme toggled. Current environment assumed." << std::endl;
            return 0;
        }
        
        if (arg == "/strings" && i + 1 < argc) {
            std::string target = argv[++i];
            std::cout << "Extracting strings from: " << target << std::endl;
            std::cout << StringsExtractor::extract(target) << std::endl;
            return 0;
        }

        if (arg == "/py" && i + 1 < argc) {
             std::string target = argv[++i];
             std::cout << "\033[1;36m[*] Python Reversing engaged for: " << target << "\033[0m" << std::endl;
             std::cout << PythonRev::runFullSequence(target, false) << std::endl;
             return 0;
        }

        if (arg == "-h" || arg == "--help") {
            std::cout << I18n::instance().get("cli_usage") << std::endl;
            std::cout << "Options:" << std::endl;
            std::cout << "  -o <file>   Output filename" << std::endl;
            std::cout << "  --intel     Use Intel syntax" << std::endl;
            std::cout << "  --graph     Generate Mermaid CFG" << std::endl;
            std::cout << "  /strings <f> Extract strings from file" << std::endl;
            std::cout << "  /py <file>  Python reversing (PyInstaller)" << std::endl;
            std::cout << "  /lang       " << I18n::instance().get("cli_lang_cmd") << std::endl;
            return 0;
        } else if (arg == "-o" && i + 1 < argc) {
            outfile = clean_path(argv[++i]);
        } else if (arg == "--intel") {
            intel = true;
        } else if (arg == "--graph") {
            graph = true;
        } else if (infile.empty()) {
            infile = clean_path(arg);
        }
    }

    if (infile.empty()) {
        std::cout << I18n::instance().get("cli_usage") << std::endl;
        std::cout << "Try 'thedecoder --help' for more information." << std::endl;
        return 1;
    }

    struct stat st;
    if (stat(infile.c_str(), &st) != 0) {
        std::cerr << I18n::instance().get("file_not_found") << ": " << infile << std::endl;
        return 1;
    }
    long total_size = st.st_size;

    print_logo();
    std::cout << I18n::instance().get("analyzing") << ": " << infile << " (" << (total_size / 1024) << " KB)\n";

    std::string cmd = "objdump -d ";
    if (intel) cmd += "-Mintel ";
    cmd += infile;

    FILE* pipe = popen(cmd.c_str(), "r");
    if (!pipe) {
        std::cerr << I18n::instance().get("objdump_fail") << std::endl;
        return 1;
    }

    std::string pipe_output_buffer;
    char buffer[4096];
    long processed = 0;
    while (fgets(buffer, sizeof(buffer), pipe) != NULL) {
        std::string line(buffer);
        pipe_output_buffer += line;
        processed += line.size();
        
        int progress = (int)((float)processed / (total_size * 5) * 100); 
        if (progress > 100) progress = 100;
        
        std::cout << "\r" << I18n::instance().get("disassembling") << "... [" << progress << "%] " << std::flush;
    }
    pclose(pipe);
    std::cout << "\n";

    std::ofstream out(outfile);
    out << pipe_output_buffer;
    out.close();

    if (graph) {
        std::cout << "[*] " << I18n::instance().get("visualizing") << "...\n";
        std::string mermaid = Visualizer::generateMermaidCFG(pipe_output_buffer);
        std::ofstream gout(outfile + ".mermaid");
        gout << mermaid;
        gout.close();
        std::cout << "[+] " << I18n::instance().get("finished") << ": " << outfile << ".mermaid\n";
    }

    std::cout << "\033[1;32m[+] " << I18n::instance().get("finished") << ": " << outfile << "\033[0m\n";
    std::cout << "[*] " << I18n::instance().get("saved_to") << outfile << std::endl;

    return 0;
}
