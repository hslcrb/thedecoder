#ifndef PYTHON_REV_H
#define PYTHON_REV_H

#include <string>
#include <iostream>
#include <cstdio>
#include <vector>
#include <fstream>
#include <unistd.h>
#include <sys/stat.h>
#include <algorithm>

/**
 * @brief Python Reversing Suite (Bridge to pyinstxtractor and uncompyle6)
 * (C) Rheehose (Rhee Creative) 2008-2026
 */
class PythonRev {
public:
    static std::string runFullSequence(const std::string& exePath) {
        std::string log;
        log += "[*] Phase 1: Archive Extraction (pyinstxtractor)\n";
        
        std::string pyInstPath = findTool("pyinstxtractor.py");
        std::string quotedExe = quote(exePath);
        std::string extractCmd;
        std::string extractOut;

        if (pyInstPath.empty()) {
            // 1. Try python module if local script not found
            extractCmd = "python3 -m pyinstxtractor " + quotedExe + " 2>&1";
            extractOut = exec(extractCmd.c_str());
        } else {
            // 2. Use local tool
            std::string quotedTool = quote(pyInstPath);
            log += "[+] Using tool at: " + pyInstPath + "\n";
            extractCmd = "python3 " + quotedTool + " " + quotedExe + " 2>&1";
            extractOut = exec(extractCmd.c_str());
        }

        log += extractOut + "\n";
 
        if (extractOut.find("Successfully extracted") == std::string::npos) {
            return log + "\n[!] Extraction failed. Check path quoting or tool availability.\n";
        }

        log += "[*] Phase 2: Locating Bytecode (.pyc)\n";
        std::string folder = exePath + "_extracted";
        log += "[+] Target folder: " + folder + "\n";

        log += "[*] Phase 3: Decompilation (uncompyle6/pycdc)\n";
        log += "[!] Manual verification required to find main pyc inside " + folder + ".\n";
        log += "[*] Use: uncompyle6 <file.pyc> to recover source.\n";

        return log;
    }

private:
    /**
     * @brief Safely quote path for shell execution / 쉘 실행을 위해 경로를 안전하게 따옴표로 감쌈
     */
    static std::string quote(const std::string& path) {
        std::string p = path;
        // Escape existing single quotes / 기존 싱글 쿼테이션 이스케이프
        size_t pos = 0;
        while ((pos = p.find("'", pos)) != std::string::npos) {
            p.replace(pos, 1, "'\\''");
            pos += 4;
        }
        return "'" + p + "'";
    }

    static bool fileExists(const std::string& path) {
        struct stat buffer;
        return (stat(path.c_str(), &buffer) == 0);
    }

    static std::string findTool(const std::string& toolName) {
        // Search order: ./tools/ (build), ../tools/ (source root), absolute path
        std::vector<std::string> searches = {
            "tools/" + toolName,
            "../tools/" + toolName,
            "/home/rheehose/문서/rheeworks_nt/thedecoder/tools/" + toolName
        };
        for (const auto& s : searches) {
            if (fileExists(s)) return s;
        }
        return "";
    }

    static std::string exec(const char* cmd) {
        char buffer[128];
        std::string result = "";
        FILE* pipe = popen(cmd, "r");
        if (!pipe) return "Error: Failed to execute command.";
        while (fgets(buffer, sizeof(buffer), pipe) != NULL) {
            result += buffer;
        }
        pclose(pipe);
        return result;
    }
};

#endif // PYTHON_REV_H
