# Dockerfile for thedecoder / thedecoder를 위한 Dockerfile

FROM ubuntu:22.04

# Install dependencies / 종속성 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    qtbase5-dev \
    binutils \
    && rm -rf /var/lib/apt/lists/*

# Set working directory / 작업 디렉토리 설정
WORKDIR /app

# Copy source code / 소스 코드 복사
COPY . .

# Build project / 프로젝트 빌드
RUN mkdir build && cd build && \
    cmake .. && \
    make

# Set entrypoint / 진입점 설정
ENTRYPOINT ["/app/build/disasm"]
