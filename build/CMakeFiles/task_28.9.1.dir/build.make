# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/server/task_28.9.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/server/task_28.9.1/build

# Include any dependencies generated for this target.
include CMakeFiles/task_28.9.1.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/task_28.9.1.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/task_28.9.1.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/task_28.9.1.dir/flags.make

CMakeFiles/task_28.9.1.dir/Main.cpp.o: CMakeFiles/task_28.9.1.dir/flags.make
CMakeFiles/task_28.9.1.dir/Main.cpp.o: /home/server/task_28.9.1/Main.cpp
CMakeFiles/task_28.9.1.dir/Main.cpp.o: CMakeFiles/task_28.9.1.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/server/task_28.9.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/task_28.9.1.dir/Main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/task_28.9.1.dir/Main.cpp.o -MF CMakeFiles/task_28.9.1.dir/Main.cpp.o.d -o CMakeFiles/task_28.9.1.dir/Main.cpp.o -c /home/server/task_28.9.1/Main.cpp

CMakeFiles/task_28.9.1.dir/Main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/task_28.9.1.dir/Main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/server/task_28.9.1/Main.cpp > CMakeFiles/task_28.9.1.dir/Main.cpp.i

CMakeFiles/task_28.9.1.dir/Main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/task_28.9.1.dir/Main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/server/task_28.9.1/Main.cpp -o CMakeFiles/task_28.9.1.dir/Main.cpp.s

# Object files for target task_28.9.1
task_28_9_1_OBJECTS = \
"CMakeFiles/task_28.9.1.dir/Main.cpp.o"

# External object files for target task_28.9.1
task_28_9_1_EXTERNAL_OBJECTS =

task_28.9.1: CMakeFiles/task_28.9.1.dir/Main.cpp.o
task_28.9.1: CMakeFiles/task_28.9.1.dir/build.make
task_28.9.1: CMakeFiles/task_28.9.1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/server/task_28.9.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable task_28.9.1"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/task_28.9.1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/task_28.9.1.dir/build: task_28.9.1
.PHONY : CMakeFiles/task_28.9.1.dir/build

CMakeFiles/task_28.9.1.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/task_28.9.1.dir/cmake_clean.cmake
.PHONY : CMakeFiles/task_28.9.1.dir/clean

CMakeFiles/task_28.9.1.dir/depend:
	cd /home/server/task_28.9.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/server/task_28.9.1 /home/server/task_28.9.1 /home/server/task_28.9.1/build /home/server/task_28.9.1/build /home/server/task_28.9.1/build/CMakeFiles/task_28.9.1.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/task_28.9.1.dir/depend

