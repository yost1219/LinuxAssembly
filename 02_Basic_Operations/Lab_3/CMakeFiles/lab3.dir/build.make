# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3

# Include any dependencies generated for this target.
include CMakeFiles/lab3.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lab3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lab3.dir/flags.make

CMakeFiles/lab3.dir/Lab3.nasm.o: CMakeFiles/lab3.dir/flags.make
CMakeFiles/lab3.dir/Lab3.nasm.o: Lab3.nasm
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ASM_NASM object CMakeFiles/lab3.dir/Lab3.nasm.o"
	/usr/bin/nasm $(ASM_NASM_INCLUDES) $(ASM_NASM_FLAGS) -f elf64 -o CMakeFiles/lab3.dir/Lab3.nasm.o /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3/Lab3.nasm

CMakeFiles/lab3.dir/main.cpp.o: CMakeFiles/lab3.dir/flags.make
CMakeFiles/lab3.dir/main.cpp.o: main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/lab3.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab3.dir/main.cpp.o -c /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3/main.cpp

CMakeFiles/lab3.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab3.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3/main.cpp > CMakeFiles/lab3.dir/main.cpp.i

CMakeFiles/lab3.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab3.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3/main.cpp -o CMakeFiles/lab3.dir/main.cpp.s

# Object files for target lab3
lab3_OBJECTS = \
"CMakeFiles/lab3.dir/Lab3.nasm.o" \
"CMakeFiles/lab3.dir/main.cpp.o"

# External object files for target lab3
lab3_EXTERNAL_OBJECTS =

lab3: CMakeFiles/lab3.dir/Lab3.nasm.o
lab3: CMakeFiles/lab3.dir/main.cpp.o
lab3: CMakeFiles/lab3.dir/build.make
lab3: CMakeFiles/lab3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable lab3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lab3.dir/build: lab3

.PHONY : CMakeFiles/lab3.dir/build

CMakeFiles/lab3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lab3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lab3.dir/clean

CMakeFiles/lab3.dir/depend:
	cd /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3 /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3 /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3 /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3 /home/student/Class/MyRepos/IQT-Assembly/02_Basic_Operations/Lab_3/CMakeFiles/lab3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lab3.dir/depend

