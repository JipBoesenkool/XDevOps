#TODO: this does more then fetchcontent, figure out how we can make this generic and more flexible
# input
# set(OpenGL_MAJOR_VERSION 4)
# set(OpenGL_MINOR_VERSION 3)
# or
# set(VULKAN_MAJOR_VERSION 1)
# set(VULKAN_MINOR_VERSION 1)

# mute cmake warnings
set(CMAKE_WARN_DEPRECATED OFF CACHE BOOL "" FORCE)

FetchContent_Declare(
    glad
    GIT_REPOSITORY https://github.com/Dav1dde/glad.git
    GIT_TAG        v2.0.8 #v2.0.8
    GIT_PROGRESS   TRUE
    SOURCE_SUBDIR  cmake
)
FetchContent_MakeAvailable(glad)

if ( EXE_GRAPHICS_API STREQUAL "OpenGL" )
    #todo: VULKAN OR OPENGL
    set(gladlib glad_gl_core_${OpenGL_MAJOR_VERSION}${OpenGL_MINOR_VERSION})
    glad_add_library(${gladlib} STATIC REPRODUCIBLE LOADER API gl:core=${OpenGL_MAJOR_VERSION}.${OpenGL_MAJOR_VERSION})
    set_target_properties(${gladlib} PROPERTIES FOLDER libs/)
elseif ( EXE_GRAPHICS_API STREQUAL "Vulkan" )
    message( FATAL_ERROR "Vulkan is not supported." )
endif()

# unmute cmake warnings
set(CMAKE_WARN_DEPRECATED ON CACHE BOOL "" FORCE)