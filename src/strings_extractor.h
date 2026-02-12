#ifndef STRINGS_EXTRACTOR_H
#define STRINGS_EXTRACTOR_H

#include <string>
#include <vector>
#include <fstream>
#include <iostream>

/**
 * @brief Native Strings Extractor / 네이티브 문자열 추출기
 * Rheehose (Rhee Creative) 2008-2026
 */

class StringsExtractor {
public:
    static std::string extract(const std::string& filePath, int minLength = 4) {
        std::ifstream file(filePath, std::ios::binary);
        if (!file.is_open()) return "Error: Cannot open file for strings extraction.";

        std::string result;
        std::string current;
        unsigned char c;

        while (file.read(reinterpret_cast<char*>(&c), 1)) {
            // ASCII printable range / ASCII 출력 가능 범위
            if (c >= 32 && c <= 126) {
                current += static_cast<char>(c);
            } else {
                if (current.length() >= static_cast<size_t>(minLength)) {
                    result += current + "\n";
                }
                current.clear();
            }
        }
        
        // Final flush / 마지막 플러시
        if (current.length() >= static_cast<size_t>(minLength)) {
            result += current + "\n";
        }

        return result;
    }
};

#endif // STRINGS_EXTRACTOR_H
