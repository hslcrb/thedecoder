#ifndef PYTHON_REV_H
#define PYTHON_REV_H

#include <string>
#include <iostream>
#include <cstdio>
#include <vector>
#include <fstream>

/**
 * @brief Python Reversing Suite (Bridge to pyinstxtractor and uncompyle6)
 * (C) Rheehose (Rhee Creative) 2008-2026
 */
class PythonRev {
public:
    static std::string runFullSequence(const std::string& exePath) {
        std::string log;
        log += "[*] Phase 1: Archive Extraction (pyinstxtractor)\n";
        
        std::string extractCmd = "python3 -m pyinstxtractor " + exePath;
        std::string extractOut = exec(extractCmd.c_str());
        log += extractOut + "\n";

        if (extractOut.find("Successfully extracted") == std::string::npos) {
            return log + "\n[!] Extraction failed or pyinstxtractor not found.\n";
        }

        log += "[*] Phase 2: Locating Bytecode (.pyc)\n";
        // Simple heuristic: look for extracted folder
        std::string folder = exePath + "_extracted";
        log += "[+] Target folder: " + folder + "\n";

        log += "[*] Phase 3: Decompilation (uncompyle6/pycdc)\n";
        log += "[!] Manual verification required to find main pyc inside " + folder + ".\n";
        log += "[*] Use: uncompyle6 <file.pyc> to recover source.\n";

        return log;
    }

private:
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
