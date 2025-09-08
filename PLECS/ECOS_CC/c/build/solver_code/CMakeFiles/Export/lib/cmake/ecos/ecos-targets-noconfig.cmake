#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ecos::ecos" for configuration ""
set_property(TARGET ecos::ecos APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(ecos::ecos PROPERTIES
  IMPORTED_IMPLIB_NOCONFIG "${_IMPORT_PREFIX}/lib/libecos.dll.a"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/bin/libecos.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS ecos::ecos )
list(APPEND _IMPORT_CHECK_FILES_FOR_ecos::ecos "${_IMPORT_PREFIX}/lib/libecos.dll.a" "${_IMPORT_PREFIX}/bin/libecos.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
