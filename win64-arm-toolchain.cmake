set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
# set(CMAKE_PREFIX_PATH "F:/Qt/Qt_5.15.10_vs2022_x64_arm64")

macro(_add_imported_target target_name file)
    if (NOT EXISTS "${file}")
        message(FATAL_ERROR "The imported target \"${target_name}\" references the file \"${file}\" but this file does not exist.")
    endif()

    if (NOT TARGET ${target_name})
        add_executable(${target_name} IMPORTED)
        set_target_properties(${target_name} PROPERTIES IMPORTED_LOCATION ${file})
    endif()
endmacro()

# use the host versions of these executables
_add_imported_target(Qt5::moc   "C:/Qt/5.15.2/msvc2019_64/bin/moc.exe")
_add_imported_target(Qt5::rcc   "C:/Qt/5.15.2/msvc2019_64/bin/rcc.exe")
_add_imported_target(Qt5::qmake "C:/Qt/5.15.2/msvc2019_64/bin/qmake.exe")

set(CompilerFlags
        CMAKE_CXX_FLAGS
        CMAKE_CXX_FLAGS_DEBUG
        CMAKE_CXX_FLAGS_RELEASE
        CMAKE_C_FLAGS
        CMAKE_C_FLAGS_DEBUG
        CMAKE_C_FLAGS_RELEASE
        )
foreach(CompilerFlag ${CompilerFlags})
  string(REPLACE "/MD" "/MT" ${CompilerFlag} "${${CompilerFlag}}")
endforeach()
