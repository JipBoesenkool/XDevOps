cmake_minimum_required(VERSION 3.22.1...3.29)
# cmake
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
## options read in from file
include(CMakeOptions.txt)
# can we pull in toolchain here?
include(platform/ConfigurePlatform)
ConfigurePlatform()
