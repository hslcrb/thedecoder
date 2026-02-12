# The Decoder - Simple Disassembler Wrapper / 간단한 역어셈블러 래퍼

`thedecoder`는 `objdump`를 래핑하는 C++ 콘솔 툴 및 Qt 기반 GUI(IDE)입니다. 바이너리 파일을 입력으로 받아 어셈블리 텍스트(`.asm`)로 출력합니다.
`thedecoder` is a C++ console tool and Qt-based GUI (IDE) that wraps `objdump`. It takes binary files as input and outputs assembly text (`.asm`).

## Features / 주요 기능
- `objdump` CLI 래핑 / `objdump` CLI wrapping.
- Intel/ATT 문법 선택 지원 / Support for Intel/ATT syntax selection.
- Qt 기반 GUI IDE (Syntax Highlighting 포함) / Qt-based GUI IDE with syntax highlighting.
- 한영병기 인터페이스 및 문서화 / Bilingual interface and documentation.

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

### CLI
```bash
### 1. Command Line Interface (CLI) / 명령줄 인터페이스
The `thedecoder` tool allows you to disassemble binary files directly from the terminal.
`thedecoder` 도구를 사용하면 터미널에서 직접 바이너리 파일을 역어셈블할 수 있습니다.

```bash
# Basic usage with Intel syntax / Intel 문법을 사용한 기본법
./build/thedecoder <input_binary> -o <output_asm> --intel

# Generate visualization map (Mermaid CFG) / 시각화 맵 생성 (Mermaid CFG)
./build/thedecoder <input_binary> -o <output_asm> --intel --graph
```

- `-o <file>`: Specify output filename (default: input name with .asm). / 출력 파일명을 지정합니다 (기본값: 입력파일명.asm).
- `--intel`: Use Intel syntax (highly recommended). / Intel 문법을 사용합니다 (강력 권장).
- `--graph`: Generate a `.map.md` file containing a Mermaid CFG. / Mermaid CFG가 포함된 `.map.md` 파일을 생성합니다.

### 2. Graphical User Interface (GUI) / 그래픽 사용자 인터페이스
The `thedecoder-ide` provides a premium, high-performance environment for binary analysis.
`thedecoder-ide`는 바이너리 분석을 위한 프리미엄 고성능 환경을 제공합니다.

```bash
# Launch the IDE / IDE 실행
./build/thedecoder-ide
```

- **Features / 주요 기능**:
    - **Premium Dark Mode**: Samsung Notes-inspired aesthetic. / 삼성 노트 스타일의 프리미엄 다크 모드.
    - **Syntax Highlighting**: Real-time coloring for mnemonics, registers, and hex bytes. / 니모닉, 레지스터, 헥사 바이트 실시간 구문 강조.
    - **Integrated Map Tab**: View the Control Flow Graph (CFG) alongside the assembly code. / 어셈블리 코드와 함께 제어 흐름 그래프(CFG)를 시각적으로 확인.
    - **File Navigator**: Easy access to your project files via the built-in tree view. / 내장 트리 뷰를 통한 편리한 프로젝트 파일 접근.

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
