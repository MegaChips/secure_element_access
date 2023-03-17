set(CMAKE_SYSTEM_NAME Generic)

if (NOT "${TOOLCHAIN_PATH}" STREQUAL "")
    set(ENV{TOOLCHAIN_PATH} "${TOOLCHAIN_PATH}")
else()
    message(FATAL_ERROR "Toolchain is not selected")
endif()

function(find_compiler compiler_path compiler_exe)
    find_program(
        ${compiler_path} ${compiler_exe}
        PATHS $ENV{TOOLCHAIN_PATH} PATH_SUFFIXES bin
        NO_DEFAULT_PATH
    )
    
    if("${${compiler_path}}" STREQUAL "${compiler_path}-NOTFOUND")
        find_program(${compiler_path} ${compiler_exe})
    endif()
    
    if("${${compiler_path}}" STREQUAL "${compiler_path}-NOTFOUND")
        set(TOOLCHAIN_PATH "" CACHE PATH "Path to search for compiler.")
        message(FATAL_ERROR "Compiler not found, you can specify search path with\
            \"TOOLCHAIN_PATH\".")
    endif()
endfunction()

find_compiler(COMPILER_CC xc32-gcc)
find_compiler(COMPILER_CXX xc32-g++)
set(COMPILER_ASM "${COMPILER_CC}" CACHE INTERNAL "")
find_compiler(COMPILER_OBJCOPY xc32-objcopy)

set(CMAKE_C_COMPILER ${COMPILER_CC} CACHE FILEPATH "C compiler")
set(CMAKE_CXX_COMPILER ${COMPILER_CXX} CACHE FILEPATH "C++ compiler")
set(CMAKE_ASM_COMPILER ${COMPILER_ASM} CACHE FILEPATH "ASM compiler")

set(CMAKE_C_COMPILER_FORCED TRUE)
set(CMAKE_CXX_COMPILER_FORCED TRUE)

get_filename_component(COMPILER_DIR "${COMPILER_CC}" DIRECTORY)
get_filename_component(CMAKE_FIND_ROOT_PATH "${COMPILER_DIR}" DIRECTORY)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)

set(COMPILER_NO_WARNINGS "-w" CACHE INTERNAL "")

