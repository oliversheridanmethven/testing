add_executable(_error_codes error_codes.c)
target_link_libraries(_error_codes error_codes testing)
add_test(NAME error_codes COMMAND _error_codes)