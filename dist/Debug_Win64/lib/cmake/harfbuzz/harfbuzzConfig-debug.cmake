#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "harfbuzz::harfbuzz" for configuration "Debug"
set_property(TARGET harfbuzz::harfbuzz APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(harfbuzz::harfbuzz PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/harfbuzz.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/harfbuzz.dll"
  )

list(APPEND _cmake_import_check_targets harfbuzz::harfbuzz )
list(APPEND _cmake_import_check_files_for_harfbuzz::harfbuzz "${_IMPORT_PREFIX}/lib/harfbuzz.lib" "${_IMPORT_PREFIX}/bin/harfbuzz.dll" )

# Import target "harfbuzz::harfbuzz-raster" for configuration "Debug"
set_property(TARGET harfbuzz::harfbuzz-raster APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(harfbuzz::harfbuzz-raster PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/harfbuzz-raster.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/harfbuzz-raster.dll"
  )

list(APPEND _cmake_import_check_targets harfbuzz::harfbuzz-raster )
list(APPEND _cmake_import_check_files_for_harfbuzz::harfbuzz-raster "${_IMPORT_PREFIX}/lib/harfbuzz-raster.lib" "${_IMPORT_PREFIX}/bin/harfbuzz-raster.dll" )

# Import target "harfbuzz::harfbuzz-vector" for configuration "Debug"
set_property(TARGET harfbuzz::harfbuzz-vector APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(harfbuzz::harfbuzz-vector PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/harfbuzz-vector.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/harfbuzz-vector.dll"
  )

list(APPEND _cmake_import_check_targets harfbuzz::harfbuzz-vector )
list(APPEND _cmake_import_check_files_for_harfbuzz::harfbuzz-vector "${_IMPORT_PREFIX}/lib/harfbuzz-vector.lib" "${_IMPORT_PREFIX}/bin/harfbuzz-vector.dll" )

# Import target "harfbuzz::harfbuzz-gpu" for configuration "Debug"
set_property(TARGET harfbuzz::harfbuzz-gpu APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(harfbuzz::harfbuzz-gpu PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/harfbuzz-gpu.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/harfbuzz-gpu.dll"
  )

list(APPEND _cmake_import_check_targets harfbuzz::harfbuzz-gpu )
list(APPEND _cmake_import_check_files_for_harfbuzz::harfbuzz-gpu "${_IMPORT_PREFIX}/lib/harfbuzz-gpu.lib" "${_IMPORT_PREFIX}/bin/harfbuzz-gpu.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
