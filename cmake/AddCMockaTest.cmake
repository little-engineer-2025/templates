function(add_mocked_test name)
  # parse arguments passed to the function
  set(options )
  set(oneValueArgs )
  set(multiValueArgs SOURCES COMPILE_OPTIONS LINK_LIBRARIES LINK_OPTIONS)
  cmake_parse_arguments(ADD_MOCKED_TEST "${options}" "${oneValueArgs}"
    "${multiValueArgs}" ${ARGN} )

  # define test
  add_cmocka_test(test_${name}
    SOURCES test_${name}.c ${ADD_MOCKED_TEST_SOURCES}
    COMPILE_OPTIONS ${DEFAULT_C_COMPILE_FLAGS}
                    ${ADD_MOCKED_TEST_COMPILE_OPTIONS}
    LINK_LIBRARIES ${CMOCKA_LIBRARIES}
                   ${ADD_MOCKED_TEST_LINK_LIBRARIES}
    LINK_OPTIONS ${ADD_MOCKED_TEST_LINK_OPTIONS})

  # allow using include from src/ directory
  target_include_directories(test_${name} PRIVATE ${CMAKE_SOURCE_DIR}/src)

  # Create link flags for mocks
  set(link_flags "")
  foreach (mock ${ADD_MOCKED_TEST_MOCKS})
    set(link_flags "${link_flags} -Wl,--wrap=${mock}")
  endforeach(mock)
endfunction()
