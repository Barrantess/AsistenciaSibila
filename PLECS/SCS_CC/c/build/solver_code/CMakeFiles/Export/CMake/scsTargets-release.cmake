#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "scs::scsdir" for configuration "Release"
set_property(TARGET scs::scsdir APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(scs::scsdir PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libscsdir.dll.a"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libscsdir.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS scs::scsdir )
list(APPEND _IMPORT_CHECK_FILES_FOR_scs::scsdir "${_IMPORT_PREFIX}/lib/libscsdir.dll.a" "${_IMPORT_PREFIX}/bin/libscsdir.dll" )

# Import target "scs::scsindir" for configuration "Release"
set_property(TARGET scs::scsindir APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(scs::scsindir PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libscsindir.dll.a"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libscsindir.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS scs::scsindir )
list(APPEND _IMPORT_CHECK_FILES_FOR_scs::scsindir "${_IMPORT_PREFIX}/lib/libscsindir.dll.a" "${_IMPORT_PREFIX}/bin/libscsindir.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
