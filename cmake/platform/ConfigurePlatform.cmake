#TODO: To specific to exciton?
################################################################################
# Function: function(ConfigureWeb)
# Parameters:
################################################################################
function(ConfigureWeb)
  set(EXE_BUILD_WEB ON CACHE BOOL "Build for the web with emscripten" FORCE)
  set(EXE_HOT_RELOAD OFF CACHE BOOL "" FORCE)
  set(BUILD_SHARED_LIBS OFF CACHE BOOL "Build using shared libraries" FORCE)
  

  set(USE_FLAGS "-sUSE_SDL=2 -sUSE_SDL_IMAGE=2 -sUSE_SDL_TTF=2 -sSDL2_IMAGE_FORMATS=\"[\"\"png\"\"]\"")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${USE_FLAGS}")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${USE_FLAGS}")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${USE_FLAGS}")
endfunction()
################################################################################
# Function: function(ConfigureWin32)
# Parameters:
################################################################################
function(ConfigureWin32)
  set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endfunction()
################################################################################
# Function: function(ConfigurePlatform)
# Parameters:
################################################################################
function(ConfigurePlatform)
  message(STATUS "ConfigurePlatform")
  if (EMSCRIPTEN)
    message(STATUS "Configure exe for web")
    ConfigureWeb()
  elseif (WIN32)
    message(STATUS "Configure exe for win32")
    ConfigureWin32()
  elseif(UNIX AND NOT APPLE)
    message(FATAL_ERROR "Linux not supported.")
  elseif (APPLE)
    message(FATAL_ERROR "Mac not supported.")
  endif ()
endfunction()