# XDevOps
Commonly used CMake scripts in a central repository for re-use across multiple projects.

# TODO: 
- Incorporate tooling from cmake_template
- Incorporate Emscripten github workflow from emscripten-cpp-cmake-template

# How to use
```
cmake_minimum_required(VERSION 3.14)
include(FetchContent)
FetchContent_Declare(XDevOps
    GIT_REPOSITORY git@github.com:JipBoesenkool/XDevOps.git
    SOURCE_DIR ${CMAKE_BINARY_DIR}/cmake
)
FetchContent_GetProperties(XDevOps)
if(NOT XDevOps_POPULATED)
    FetchContent_Populate(XDevOps)
    list(APPEND CMAKE_MODULE_PATH ${XDevOps_SOURCE_DIR}/cmake)
endif()

project(MyProj)

```
Professional CMake: A Practical Guide, Ch. 28.2.2. Other Uses For FetchContent

# Resources
- [Professional CMake: A Practical Guide](https://crascit.com/professional-cmake/)
- [cmake_template](https://github.com/cpp-best-practices/cmake_template)
- [emscripten-cpp-cmake-template](https://github.com/Zephilinox/emscripten-cpp-cmake-template)