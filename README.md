# The Decoder - Simple Disassembler Wrapper / 간단한 역어셈블러 래퍼

`thedecoder`는 `objdump`를 래핑하는 C++ 콘솔 툴 및 Qt 기반 GUI(IDE)입니다. 바이너리 파일을 입력으로 받아 어셈블리 텍스트(`.asm`)로 출력합니다.
`thedecoder` is a C++ console tool and Qt-based GUI (IDE) that wraps `objdump`. It takes binary files as input and outputs assembly text (`.asm`).

- **Async GUI & Memory Safety**: Prevents OOM crashes with non-blocking streaming engine. / 비차단 스트리밍 엔진으로 OOM 크래시 방지.
- **Modern CLI**: Includes ASCII art logo and interactive terminal progress bars. / ASCII 아트 로고 및 인터랙티브 터미널 프로그래스 바 포함.
- **Zero-Config Auto-Detection**: Automatically identifies binary formats and architectures. / 바이너리 형식 및 아키텍처 자동 탐지.
- **Intel/ATT Syntax**: Effortlessly switch between syntax styles. / 손쉬운 문법 스타일 전환.
- **Bilingual Support**: Fully documented in Korean and English. / 한영병기 문서화 완비.

## Requirements / 요구 사양
- CMake 3.5+
- C++17 Compiler (g++/clang++)
- `objdump` (binutils)
- Qt5 (for IDE, Optional)

## Build Instructions / 빌드 방법
```bash
mkdir -p build && cd build
cmake ..
cmake --build .
```

## Usage / 사용법

### 1. Command Line Interface (CLI) / 명령줄 인터페이스
The `thedecoder` tool provides a world-class interactive experience.
`thedecoder` 도구는 세계 최고 수준의 인터랙티브 경험을 제공합니다.

```bash
# Simply run with binary (Auto-detects arch and sets Intel syntax for x86)
./build/thedecoder <input_binary>

# Full options with visualization graph
./build/thedecoder <input_binary> -o my_code.asm --graph
```

- **Interactive Progress Bar**: Real-time feedback during disassembly. / 역어셈블 중 실시간 프로그래스 바 제공.
- **Smart Path Handling**: Automatically strips quotes and handles various slash formats. / 따옴표 및 다양한 슬래시 형식 자동 처리.
- **ASCII Art Header**: Starts with a "Monster Grade" ASCII branding. / "Monster Grade" ASCII 브랜딩 헤더와 함께 시작.

### 2. Graphical User Interface (GUI) / 그래픽 사용자 인터페이스
The `thedecoder-ide` provides a premium, high-performance environment for binary analysis.
`thedecoder-ide`는 바이너리 분석을 위한 프리미엄 고성능 환경을 제공합니다.

```bash
# Launch the IDE / IDE 실행
./build/thedecoder-ide
```

- **Features / 주요 기능**:
    - **Fully Asynchronous UI**: Prevents application hangs during analysis. / 분석 중 UI 멈춤 현상을 완전히 해결.
    - **Progress Tracking**: Real-time visual progress bar in the status bar. / 상태 표시줄의 실시간 시각적 프로그래스 바.
    - **Premium Dark Mode**: Samsung Notes-inspired aesthetic. / 삼성 노트 스타일의 프리미엄 다크 모드.
    - **Syntax Highlighting**: Enhanced register and mnemonic coloring. / 강화된 레지스터 및 니모닉 구문 강조.
    - **Memory Safety**: Safely streams massive binaries without OOM. / OOM 없이 대용량 바이너리를 안전하게 스트리밍.

---

## Author / 제작자
- **Rheehose (Rhee Creative)**
- **Website**: [https://rheehose.com](https://rheehose.com)
- **Copyright**: (C) 2008-2026 Rheehose (Rhee Creative)

## Contributing / 기여하기
We welcome contributions to make "thedecoder" even more powerful! Please refer to the [CONTRIBUTING.md](file:///home/rheehose/문서/rheeworks_nt/thedecoder/CONTRIBUTING.md) file for guidelines.
"thedecoder"를 더 강력하게 만들기 위한 기여를 환영합니다! 가이드라인은 [CONTRIBUTING.md](file:///home/rheehose/문서/rheeworks_nt/thedecoder/CONTRIBUTING.md) 파일을 참조하십시오.

## License / 라이선스
Apache 2.0 License. See the [LICENSE](file:///home/rheehose/문서/rheeworks_nt/thedecoder/LICENSE) file for details.
All external software components are acknowledged in the [NOTICE](file:///home/rheehose/문서/rheeworks_nt/thedecoder/NOTICE) file.

---
(C) Rheehose (Rhee Creative) 2008-2026
"Beyond Perfection, Monster Grade"
