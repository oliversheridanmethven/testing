
## So we can find modules in the project root. (e.g. Criterion)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/")
# For C we quite like the Criterion framework.
find_package(Criterion REQUIRED)
# For C++ we like the Google framework.
find_package(GTest REQUIRED)

add_library(testing INTERFACE)
target_include_directories(testing INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/..)
target_link_libraries(testing
        INTERFACE GTest::gtest_main
        #[[Google must come before Criterion, else Criterion tries to capture Google tests and fails]]
        criterion)

add_subdirectory(tests)
