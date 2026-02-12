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
#include <sstream>

/**
 * @brief Python Reversing Suite (Bridge to pyinstxtractor and pycdc)
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
            extractCmd = "python3 -m pyinstxtractor " + quotedExe + " 2>&1";
            extractOut = exec(extractCmd.c_str());
        } else {
            std::string quotedTool = quote(pyInstPath);
            log += "[+] Using tool at: " + pyInstPath + "\n";
            extractCmd = "python3 " + quotedTool + " " + quotedExe + " 2>&1";
            extractOut = exec(extractCmd.c_str());
        }

        log += extractOut + "\n";
 
        if (extractOut.find("Successfully extracted") == std::string::npos) {
            return log + "\n[!] Extraction failed. Check path quoting or tool availability.\n";
        }

        // Find entry point from output / 출력에서 진입점 찾기
        std::string entryPoint = "";
        std::stringstream ss(extractOut);
        std::string line;
        while (std::getline(ss, line)) {
            if (line.find("Possible entry point:") != std::string::npos) {
                size_t pos = line.find(":");
                if (pos != std::string::npos) {
                    entryPoint = line.substr(pos + 1);
                    // Trim spaces / 공백 제거
                    entryPoint.erase(0, entryPoint.find_first_not_of(" "));
                    entryPoint.erase(entryPoint.find_last_not_of(" ") + 1);
                }
            }
        }

        log += "[*] Phase 2: Locating Bytecode (.pyc)\n";
        std::string folder = exePath + "_extracted";
        log += "[+] Target folder: " + folder + "\n";
        if (!entryPoint.empty()) {
            log += "[+] Detected entry point: " + entryPoint + "\n";
        }

        log += "[*] Phase 3: Decompilation (pycdc)\n";
        std::string pycdcPath = findTool("pycdc");
        if (pycdcPath.empty()) {
            log += "[!] pycdc not found in tools/. Manual decompile required.\n";
            log += "[*] Use: tools/pycdc " + folder + "/" + (entryPoint.empty() ? "*.pyc" : entryPoint) + "\n";
        } else if (entryPoint.empty()) {
            log += "[!] Could not determine entry point. Check folder: " + folder + "\n";
        } else {
            std::string pycFullPath = folder + "/" + entryPoint;
            log += "[+] Decompiling " + pycFullPath + " ...\n";
            std::string decompileCmd = quote(pycdcPath) + " " + quote(pycFullPath) + " 2>&1";
            std::string decompileOut = exec(decompileCmd.c_str());
            
            log += "\n--- DECOMPILED SOURCE / 디컴파일된 소스 ---\n";
            log += decompileOut;
            log += "\n-------------------------------------------\n";
        }

        return log;
    }

private:
    static std::string quote(const std::string& path) {
        std::string p = path;
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
