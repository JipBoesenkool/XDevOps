include(FetchContent)

FetchContent_Declare(
  stb
  GIT_REPOSITORY "https://github.com/nothings/stb.git"
  CONFIGURE_COMMAND "" BUILD_COMMAND "")
FetchContent_GetProperties(stb)

if(NOT stb_POPULATED)
  FetchContent_Populate(stb)
endif()

add_library(stb INTERFACE)
target_include_directories(stb INTERFACE ${stb_SOURCE_DIR})