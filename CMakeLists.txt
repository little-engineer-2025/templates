cmake_minimum_required(VERSION 3.30)

# TODO Update with your project name
project(my-project)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Add the subdirectories
add_subdirectory(src)

# cmocka
option(ENABLE_TESTS "Perform unit tests after build" ON)
if (ENABLE_TESTS)
  find_package(cmocka CONFIG REQUIRED)
  include(AddCMockaTest)
  # include(AddMockedTest)
  add_subdirectory(test)
  enable_testing()
  add_subdirectory(test)
endif(ENABLE_TESTS)

