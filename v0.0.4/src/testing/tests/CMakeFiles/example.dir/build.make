# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.27.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.27.0/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/oliver/ClionProjects/testing

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/oliver/ClionProjects/testing

# Include any dependencies generated for this target.
include src/testing/tests/CMakeFiles/example.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/testing/tests/CMakeFiles/example.dir/compiler_depend.make

# Include the progress variables for this target.
include src/testing/tests/CMakeFiles/example.dir/progress.make

# Include the compile flags for this target's objects.
include src/testing/tests/CMakeFiles/example.dir/flags.make

src/testing/tests/CMakeFiles/example.dir/example.c.o: src/testing/tests/CMakeFiles/example.dir/flags.make
src/testing/tests/CMakeFiles/example.dir/example.c.o: src/testing/tests/example.c
src/testing/tests/CMakeFiles/example.dir/example.c.o: src/testing/tests/CMakeFiles/example.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/oliver/ClionProjects/testing/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/testing/tests/CMakeFiles/example.dir/example.c.o"
	cd /Users/oliver/ClionProjects/testing/src/testing/tests && gcc-13 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/testing/tests/CMakeFiles/example.dir/example.c.o -MF CMakeFiles/example.dir/example.c.o.d -o CMakeFiles/example.dir/example.c.o -c /Users/oliver/ClionProjects/testing/src/testing/tests/example.c

src/testing/tests/CMakeFiles/example.dir/example.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/example.dir/example.c.i"
	cd /Users/oliver/ClionProjects/testing/src/testing/tests && gcc-13 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/oliver/ClionProjects/testing/src/testing/tests/example.c > CMakeFiles/example.dir/example.c.i

src/testing/tests/CMakeFiles/example.dir/example.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/example.dir/example.c.s"
	cd /Users/oliver/ClionProjects/testing/src/testing/tests && gcc-13 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/oliver/ClionProjects/testing/src/testing/tests/example.c -o CMakeFiles/example.dir/example.c.s

# Object files for target example
example_OBJECTS = \
"CMakeFiles/example.dir/example.c.o"

# External object files for target example
example_EXTERNAL_OBJECTS =

bin/example: src/testing/tests/CMakeFiles/example.dir/example.c.o
bin/example: src/testing/tests/CMakeFiles/example.dir/build.make
bin/example: /Library/Frameworks/Python.framework/Versions/3.11/lib/libpython3.11.dylib
bin/example: src/testing/tests/CMakeFiles/example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/oliver/ClionProjects/testing/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/example"
	cd /Users/oliver/ClionProjects/testing/src/testing/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/testing/tests/CMakeFiles/example.dir/build: bin/example
.PHONY : src/testing/tests/CMakeFiles/example.dir/build

src/testing/tests/CMakeFiles/example.dir/clean:
	cd /Users/oliver/ClionProjects/testing/src/testing/tests && $(CMAKE_COMMAND) -P CMakeFiles/example.dir/cmake_clean.cmake
.PHONY : src/testing/tests/CMakeFiles/example.dir/clean

src/testing/tests/CMakeFiles/example.dir/depend:
	cd /Users/oliver/ClionProjects/testing && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/oliver/ClionProjects/testing /Users/oliver/ClionProjects/testing/src/testing/tests /Users/oliver/ClionProjects/testing /Users/oliver/ClionProjects/testing/src/testing/tests /Users/oliver/ClionProjects/testing/src/testing/tests/CMakeFiles/example.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/testing/tests/CMakeFiles/example.dir/depend

