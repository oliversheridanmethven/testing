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

# Utility rule file for PyPackageBuild.

# Include any custom commands dependencies for this target.
include src/common/CMakeFiles/PyPackageBuild.dir/compiler_depend.make

# Include the progress variables for this target.
include src/common/CMakeFiles/PyPackageBuild.dir/progress.make

src/common/CMakeFiles/PyPackageBuild:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/oliver/ClionProjects/testing/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building python wheel package"

PyPackageBuild: src/common/CMakeFiles/PyPackageBuild
PyPackageBuild: src/common/CMakeFiles/PyPackageBuild.dir/build.make
.PHONY : PyPackageBuild

# Rule to build all files generated by this target.
src/common/CMakeFiles/PyPackageBuild.dir/build: PyPackageBuild
.PHONY : src/common/CMakeFiles/PyPackageBuild.dir/build

src/common/CMakeFiles/PyPackageBuild.dir/clean:
	cd /Users/oliver/ClionProjects/testing/build/src/common && $(CMAKE_COMMAND) -P CMakeFiles/PyPackageBuild.dir/cmake_clean.cmake
.PHONY : src/common/CMakeFiles/PyPackageBuild.dir/clean

src/common/CMakeFiles/PyPackageBuild.dir/depend:
	cd /Users/oliver/ClionProjects/testing/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/oliver/ClionProjects/testing /Users/oliver/ClionProjects/testing/src/common /Users/oliver/ClionProjects/testing/build /Users/oliver/ClionProjects/testing/build/src/common /Users/oliver/ClionProjects/testing/build/src/common/CMakeFiles/PyPackageBuild.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/common/CMakeFiles/PyPackageBuild.dir/depend
