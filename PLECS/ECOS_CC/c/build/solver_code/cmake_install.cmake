# Install script for directory: C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code

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
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/build/out/libecos.dll.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/build/out/libecos.dll")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libecos.dll" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libecos.dll")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/msys64/ucrt64/bin/strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libecos.dll")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ecos" TYPE FILE FILES
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/external/SuiteSparse_config/SuiteSparse_config.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/cone.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/ctrlc.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/data.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/ecos.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/ecos_bb.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/equil.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/expcone.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/glblopts.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/kkt.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/spla.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/splamm.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/timer.h"
    "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/solver_code/include/wright_omega.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ecos/ecos-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ecos/ecos-targets.cmake"
         "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/build/solver_code/CMakeFiles/Export/lib/cmake/ecos/ecos-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ecos/ecos-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ecos/ecos-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ecos" TYPE FILE FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/build/solver_code/CMakeFiles/Export/lib/cmake/ecos/ecos-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ecos" TYPE FILE FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/build/solver_code/CMakeFiles/Export/lib/cmake/ecos/ecos-targets-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ecos" TYPE FILE FILES "C:/Users/JR/CProjects/PlecsDLL/MCC_CC/ECOS_CC/c/build/solver_code/ecos-config.cmake")
endif()

