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
CMAKE_BINARY_DIR = /Users/oliver/ClionProjects/testing/build

# Include any dependencies generated for this target.
include CMakeFiles/bar.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/bar.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/bar.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bar.dir/flags.make

CMakeFiles/bar.dir/foo/bar/bar.c.o: CMakeFiles/bar.dir/flags.make
CMakeFiles/bar.dir/foo/bar/bar.c.o: /Users/oliver/ClionProjects/testing/foo/bar/bar.c
CMakeFiles/bar.dir/foo/bar/bar.c.o: CMakeFiles/bar.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/oliver/ClionProjects/testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/bar.dir/foo/bar/bar.c.o"
	gcc-13 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/bar.dir/foo/bar/bar.c.o -MF CMakeFiles/bar.dir/foo/bar/bar.c.o.d -o CMakeFiles/bar.dir/foo/bar/bar.c.o -c /Users/oliver/ClionProjects/testing/foo/bar/bar.c

CMakeFiles/bar.dir/foo/bar/bar.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/bar.dir/foo/bar/bar.c.i"
	gcc-13 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/oliver/ClionProjects/testing/foo/bar/bar.c > CMakeFiles/bar.dir/foo/bar/bar.c.i

CMakeFiles/bar.dir/foo/bar/bar.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/bar.dir/foo/bar/bar.c.s"
	gcc-13 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/oliver/ClionProjects/testing/foo/bar/bar.c -o CMakeFiles/bar.dir/foo/bar/bar.c.s

# Object files for target bar
bar_OBJECTS = \
"CMakeFiles/bar.dir/foo/bar/bar.c.o"

# External object files for target bar
bar_EXTERNAL_OBJECTS =

libbar.so: CMakeFiles/bar.dir/foo/bar/bar.c.o
libbar.so: CMakeFiles/bar.dir/build.make
libbar.so: CMakeFiles/bar.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/oliver/ClionProjects/testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared module libbar.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bar.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bar.dir/build: libbar.so
.PHONY : CMakeFiles/bar.dir/build

CMakeFiles/bar.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bar.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bar.dir/clean

CMakeFiles/bar.dir/depend:
	cd /Users/oliver/ClionProjects/testing/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/oliver/ClionProjects/testing /Users/oliver/ClionProjects/testing /Users/oliver/ClionProjects/testing/build /Users/oliver/ClionProjects/testing/build /Users/oliver/ClionProjects/testing/build/CMakeFiles/bar.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/bar.dir/depend

