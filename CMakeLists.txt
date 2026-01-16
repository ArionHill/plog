cmake_minimum_required(VERSION 3.10)

project(plog VERSION 1.0)

enable_testing()

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_RPATH ${LIBSTDCPP_DIR})

set(PLOG_VERSION_MAJOR 0)
set(PLOG_VERSION_MINOR 0)
set(PLOG_VERSION_PATCH 0)

include_directories(${PROJECT_SOURCE_DIR}/include)

option(PLOG_BUILD_WARNINGS "Enable compiler warnings" OFF)

# clang-tidy
option(PLOG_TIDY "run clang-tidy" OFF)

if(PLOG_TIDY)
    set(CMAKE_CXX_CLANG_TIDY "clang-tidy")
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    message(STATUS "Enabled clang-tidy")
endif()

add_subdirectory(src)
add_subdirectory(example)
