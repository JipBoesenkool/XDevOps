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
