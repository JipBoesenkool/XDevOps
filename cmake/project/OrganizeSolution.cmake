################################################################################
# Function: function(Organize target)
# Description: Organizes project files to resemble the original file structure
################################################################################
function(OrganizeSolution target)
  SetSolutionFolder(${target})
  GroupSourcesByFolder(${target})
endfunction()
################################################################################
# Function: function(SetSolutionFolder target)
# Description: Sets the solution directory relative to the project root directory
################################################################################
function(SetSolutionFolder target)
  get_target_property( TARGET_DIR ${target} SOURCE_DIR)
  file(RELATIVE_PATH relative_path "${CMAKE_SOURCE_DIR}" ${TARGET_DIR})
  set_target_properties(${target} PROPERTIES FOLDER ${relative_path})
endfunction()

################################################################################
# Function: function(GroupSourcesByFolder target)
# Description: automatically re-groups the source files into a structure resembling the original file structure.
# Source: https://github.com/TheLartians/GroupSourcesByFolder.cmake
################################################################################
function(GroupSourcesByFolder target)
  set(SOURCE_GROUP_DELIMITER "/")
  set(last_dir "")
  set(files "")

  get_target_property( TARGET_DIR ${target} SOURCE_DIR)
  get_target_property( SOURCES ${target} SOURCES)
  #message(STATUS "sources: ${SOURCES}")
  #message(STATUS "dir: ${TARGET_DIR}")
  
  foreach(file ${SOURCES})
    get_filename_component(dir "${file}" PATH)
    #message(STATUS "target dir: ${dir}")
    if(NOT "${dir}" STREQUAL "${last_dir}")
      if(files)
        source_group("${last_dir}" FILES ${files})
      endif()
      set(files "")
    endif()
    set(files ${files} ${file})
    set(last_dir "${dir}")
  endforeach()

  if(files)
    source_group("${last_dir}" FILES ${files})
  endif()
endfunction()