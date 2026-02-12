cmake_minimum_required(VERSION 3.5)
project(thedecoder)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(thedecoder src/thedecoder.cpp src/visualizer.cpp)

# Optional Qt-based IDE
find_package(Qt5 COMPONENTS Widgets QUIET)
if (Qt5Widgets_FOUND)
	add_executable(thedecoder-ide 
		src/ide/main.cpp 
		src/ide/mainwindow.cpp 
		src/ide/highlighter.cpp 
		src/visualizer.cpp
		src/ide/mainwindow.h 
		src/ide/highlighter.h
	)
	set_target_properties(thedecoder-ide PROPERTIES AUTOMOC ON)
	target_link_libraries(thedecoder-ide Qt5::Widgets)
else()
	message(STATUS "Qt5 Widgets not found — skipping building thedecoder-ide (install libqt5-dev)")
endif()
