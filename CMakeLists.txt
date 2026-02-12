cmake_minimum_required(VERSION 3.5)
project(disasm)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(disasm src/disasm.cpp src/visualizer.cpp)

# Optional Qt-based IDE
find_package(Qt5 COMPONENTS Widgets QUIET)
if (Qt5Widgets_FOUND)
	add_executable(disasm-ide 
		src/ide/main.cpp 
		src/ide/mainwindow.cpp 
		src/ide/highlighter.cpp 
		src/visualizer.cpp
		src/ide/mainwindow.h 
		src/ide/highlighter.h
	)
	set_target_properties(disasm-ide PROPERTIES AUTOMOC ON)
	target_link_libraries(disasm-ide Qt5::Widgets)
else()
	message(STATUS "Qt5 Widgets not found — skipping building disasm-ide (install libqt5-dev)")
endif()
