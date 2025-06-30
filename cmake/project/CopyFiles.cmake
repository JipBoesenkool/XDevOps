################################################################################
# Function: function(CopyResources target)
# Parameters:
# target: The build target
################################################################################
function(CopyResources target)
  get_target_property(TARGET_SOURCE_DIR ${target} SOURCE_DIR)
  get_target_property( TARGET_FOLDER_DIR ${target} FOLDER )

  set(TARGET_NAME ${target}-resources)
  add_custom_target(
    ${TARGET_NAME}
    COMMAND ${CMAKE_COMMAND} -E copy_directory_if_different 
    "${TARGET_SOURCE_DIR}/resources/" 
    "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}$<CONFIG>/resources/"
  )
  add_dependencies(${target} ${TARGET_NAME})
  set_target_properties( ${TARGET_NAME} PROPERTIES FOLDER ${TARGET_FOLDER_DIR})
endfunction()
################################################################################
# Function: function(CopyFile target)
# Parameters:
# target: The build target
################################################################################
function(CopyFile target file destination)
    get_target_property(TARGET_SOURCE_DIR ${target} SOURCE_DIR)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different 
        ${file}
        "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}$<CONFIG>/${destination}"
    )
endfunction()
################################################################################
# Function: function(CopyFile target)
# Parameters:
# target: The build target
################################################################################
function(CopyDir target dir destination)
    get_target_property(TARGET_SOURCE_DIR ${target} SOURCE_DIR)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory_if_different 
        ${dir} 
        "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}$<CONFIG>/${destination}"
    )
endfunction()