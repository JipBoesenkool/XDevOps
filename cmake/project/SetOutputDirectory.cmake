################################################################################
# Function: function(GetArchitecture out_os_arch)
# Description: get an integer indicating if the platform is 32-bit or 64-bit
################################################################################
function(GetArchitecture out_os_arch)
    set(OS_ARCH 32)
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        set(OS_ARCH 64)
    endif()
    set(${out_os_arch} ${OS_ARCH} PARENT_SCOPE)
endfunction()
################################################################################
# Function: function(SetOutputDirectory directory_filepath)
# Description: Set the global variables CMAKE_[TYPE]_OUTPUT_DIRECTORY
################################################################################
function(SetOutputDirectory directory_filepath)
    GetArchitecture(OS_ARCH)

    set (filepath "${directory_filepath}/${CMAKE_SYSTEM_NAME}${OS_ARCH}/") #CMAKE_BUILD_TYPE can't be evaluated at this time
    set(CMAKE_PDB_OUTPUT_DIRECTORY     "${filepath}" PARENT_SCOPE) #pdb
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${filepath}" PARENT_SCOPE) #static libs
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${filepath}" PARENT_SCOPE) #dll on not windows
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${filepath}" PARENT_SCOPE) #exe and (dll on windows)
endfunction()