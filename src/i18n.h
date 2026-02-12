#ifndef I18N_H
#define I18N_H

#include <string>
#include <map>
#include <vector>

/**
 * @brief Internationalization System / 국제화 시스템
 * Rheehose (Rhee Creative) 2008-2026
 */

enum class Language {
    KO,
    EN
};

class I18n {
public:
    static I18n& instance() {
        static I18n inst;
        return inst;
    }

    void setLanguage(Language lang) { m_currentLang = lang; }
    Language currentLanguage() const { return m_currentLang; }

    std::string get(const std::string& key) {
        if (m_dict.find(key) == m_dict.end()) return key;
        return (m_currentLang == Language::KO) ? m_dict[key].ko : m_dict[key].en;
    }

    void toggleLanguage() {
        m_currentLang = (m_currentLang == Language::KO) ? Language::EN : Language::KO;
    }

private:
    struct Entry {
        std::string ko;
        std::string en;
    };

    I18n() : m_currentLang(Language::KO) {
        // Shared & GUI Strings / 공유 및 GUI 문자열
        m_dict["app_title"] = {"thedecoder - 상급 바이너리 분석기", "thedecoder - Advanced Binary Analyzer"};
        m_dict["open_binary"] = {"바이너리 열기", "Open Binary"};
        m_dict["save_asm"] = {"ASM 저장", "Save ASM"};
        m_dict["save_as"] = {"다른 이름으로 저장", "Save As"};
        m_dict["intel_syntax"] = {"Intel 문법", "Intel Syntax"};
        m_dict["lang_toggle"] = {"Language: KR", "Language: EN"};
        m_dict["read_only"] = {"읽기 전용", "Read Only"};
        m_dict["ready"] = {"준비됨", "Ready"};
        m_dict["disassembling"] = {"역어셈블 중...", "Disassembling..."};
        m_dict["finished"] = {"완료됨", "Finished"};
        m_dict["saved_to"] = {"저장 완료: ", "Saved to: "};
        m_dict["readonly_warn"] = {"상단에서 '읽기 전용' 체크를 해제한 후 편집하십시오.", "Please uncheck 'Read Only' at the top to edit."};
        m_dict["extract_warn"] = {"컨테이너 파일입니다. 압축을 해제한 후 내부 바이너리를 여십시오.", "This is a container. Please extract and open the internal binary."};
        
        // CLI specific / CLI 전용
        m_dict["cli_usage"] = {"사용법: thedecoder <바이너리> [옵션]", "Usage: thedecoder <binary> [options]"};
        m_dict["cli_lang_cmd"] = {"/lang: 언어 전환 (현재: 한국어)", "/lang: Toggle language (Current: English)"};
        m_dict["unknown_option"] = {"알 수 없는 옵션", "Unknown option"};
        m_dict["error_file_not_found"] = {"파일을 찾을 수 없습니다", "Error: File not found"};
        m_dict["error_objdump_failed"] = {"objdump 실행 실패. binutils 설치 여부를 확인하십시오.", "Failed to run objdump. Ensure binutils is installed."};
        m_dict["error_output_file_failed"] = {"출력 파일을 열 수 없습니다", "Failed to open output file"};
        m_dict["analyzing"] = {"분석 중", "Analyzing"};
        m_dict["note_objdump_status"] = {"참고: objdump가 다음 상태로 종료되었습니다", "Note: objdump finished with status"};
    }

    Language m_currentLang;
    std::map<std::string, Entry> m_dict;
};

#endif // I18N_H
