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
# Basic usage / 기본 사용법
./disasm <binary>

# Specify output / 출력 지정
./disasm <binary> -o output.asm

# Intel syntax / Intel 문법
./disasm <binary> --intel
```

### GUI IDE
```bash
./disasm-ide
```

## Author / 제작자
- **Rheehose (Rhee Creative)**
- **Website**: [https://rheehose.com](https://rheehose.com)
- **Copyright**: (C) 2008-2026 Rheehose (Rhee Creative)

## License / 라이선스
Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
Apache License, Version 2.0에 따라 라이선스가 부여됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하십시오.
