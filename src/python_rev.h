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
#include <thread>
#include <chrono>

/**
 * @brief Python Reversing Suite (Bridge to pyinstxtractor and pycdc)
 * (C) Rheehose (Rhee Creative) 2008-2026
 */
class PythonRev {
public:
    static std::string runFullSequence(const std::string& exePath, bool isGui = false) {
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
        std::string pycFullPath = folder + "/" + entryPoint;

        if (pycdcPath.empty()) {
            log += "[!] pycdc not found in tools/. Manual decompile required.\n";
        } else if (entryPoint.empty()) {
            log += "[!] Could not determine entry point. Check folder: " + folder + "\n";
        } else {
            log += "[+] Decompiling " + pycFullPath + " ...\n";
            std::string decompileCmd = quote(pycdcPath) + " " + quote(pycFullPath) + " 2>&1";
            std::string decompileOut = exec(decompileCmd.c_str());
            
            log += "\n--- DECOMPILED SOURCE / 디컴파일된 소스 ---\n";
            log += decompileOut;
            log += "\n-------------------------------------------\n";
        }

        if (!isGui) {
            log += "\n[*] Monster Grade Automation: Opening source in 5 seconds...\n";
            for (int i = 5; i > 0; --i) {
                std::cout << "\r[*] " << i << " SECS REMAINING... [";
                for (int j = 0; j < 20; ++j) {
                    if (j < (5 - i + 1) * 4) std::cout << "=";
                    else std::cout << " ";
                }
                std::cout << "] " << std::flush;
                std::this_thread::sleep_for(std::chrono::seconds(1));
            }
            std::cout << "\n[+] Launching editor...\n";
            // For CLI, we just print where to find it or suggest xdg-open if available
            std::string openCmd = "vi " + quote(folder + "/extracted_source.py"); // Template
            // Actual decompile for saving
            std::string pycdcExec = findTool("pycdc");
            if (!pycdcExec.empty() && !entryPoint.empty()) {
                std::string saveCmd = quote(pycdcExec) + " " + quote(pycFullPath) + " > " + quote(folder + "/source_recovered.py");
                system(saveCmd.c_str());
                log += "\n[+] Source saved to: " + folder + "/source_recovered.py\n";
            }
        }

        return log;
    }

    /**
     * @brief Get the full path to the recovered script / 복구된 스크립트의 전체 경로 반환
     */
    static std::string getRecoveredPath(const std::string& exePath) {
        return exePath + "_extracted/source_recovered.py";
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
            "/home/rheehose/문서/rheeworks_nt/thedecoder/tools/" + toolName,
            "./build/tools/" + toolName
        };
        for (const auto& s : searches) {
            if (fileExists(s)) return s;
        }
        return "";
    }

    static std::string exec(const char* cmd) {
        char buffer[1024];
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
