#VCPKG_EXECUTABLE_PATH
message(STATUS "Checking for vcpkg.....")
find_program(VCPKG_EXECUTABLE NAMES vcpkg PATHS "vcpkg" "VCPKG_ROOT" ENV VCPKG_ROOT NO_DEFAULT_PATH)

if(NOT VCPKG_EXECUTABLE)
    if(CMAKE_HOST_WIN32)
        set(VCPKG_BOOTSTRAP_SCRIPT bootstrap-vcpkg.bat)
    else()
        set(VCPKG_BOOTSTRAP_SCRIPT ./bootstrap-vcpkg.sh)
    endif()
    message(STATUS "Bootstrapping vcpkg!")
    execute_process(COMMAND "${VCPKG_BOOTSTRAP_SCRIPT}" "-disableMetrics"
                    WORKING_DIRECTORY "${VCPKG_ROOT}"
                    COMMAND_ECHO STDOUT
                    OUTPUT_STRIP_TRAILING_WHITESPACE
                    ERROR_STRIP_TRAILING_WHITESPACE
                    COMMAND_ERROR_IS_FATAL ANY)
else()
    message(STATUS "vcpkg found at: ${VCPKG_EXECUTABLE}")
endif()