# Install script for directory: C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/solver_code

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/cvxpygen")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "C:/msys64/ucrt64/bin/objdump.exe")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/build/lib/libscsdir.dll.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xbinx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/build/bin/libscsdir.dll")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libscsdir.dll" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libscsdir.dll")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/msys64/ucrt64/bin/strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libscsdir.dll")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xruntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/scs" TYPE FILE FILES
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/solver_code/include/scs_types.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/solver_code/include/scs.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/build/lib/libscsindir.dll.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xbinx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/build/bin/libscsindir.dll")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libscsindir.dll" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libscsindir.dll")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/msys64/ucrt64/bin/strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libscsindir.dll")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xruntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/scs" TYPE FILE FILES
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/solver_code/include/scs_types.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/solver_code/include/scs.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xscsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/CMake" TYPE FILE FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/build/scsConfigVersion.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xscsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/CMake" TYPE FILE RENAME "scsConfig.cmake" FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/build/solver_code/scsConfig.cmake.install")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xscsx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/CMake/scsTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/CMake/scsTargets.cmake"
         "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/build/solver_code/CMakeFiles/Export/CMake/scsTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/CMake/scsTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/CMake/scsTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/CMake" TYPE FILE FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/build/solver_code/CMakeFiles/Export/CMake/scsTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/CMake" TYPE FILE FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/SCS_CC/c/build/solver_code/CMakeFiles/Export/CMake/scsTargets-release.cmake")
  endif()
endif()

