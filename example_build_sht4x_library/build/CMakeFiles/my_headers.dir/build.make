# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/pi/Documents/_github/sht4x_docker/example_build_sht4x_library

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/Documents/_github/sht4x_docker/example_build_sht4x_library/build

# Include any dependencies generated for this target.
include CMakeFiles/my_headers.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/my_headers.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/my_headers.dir/flags.make

# Object files for target my_headers
my_headers_OBJECTS =

# External object files for target my_headers
my_headers_EXTERNAL_OBJECTS =

libmy_headers.a: CMakeFiles/my_headers.dir/build.make
libmy_headers.a: CMakeFiles/my_headers.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/Documents/_github/sht4x_docker/example_build_sht4x_library/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking CXX static library libmy_headers.a"
	$(CMAKE_COMMAND) -P CMakeFiles/my_headers.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_headers.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/my_headers.dir/build: libmy_headers.a

.PHONY : CMakeFiles/my_headers.dir/build

CMakeFiles/my_headers.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/my_headers.dir/cmake_clean.cmake
.PHONY : CMakeFiles/my_headers.dir/clean

CMakeFiles/my_headers.dir/depend:
	cd /home/pi/Documents/_github/sht4x_docker/example_build_sht4x_library/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Documents/_github/sht4x_docker/example_build_sht4x_library /home/pi/Documents/_github/sht4x_docker/example_build_sht4x_library /home/pi/Documents/_github/sht4x_docker/example_build_sht4x_library/build /home/pi/Documents/_github/sht4x_docker/example_build_sht4x_library/build /home/pi/Documents/_github/sht4x_docker/example_build_sht4x_library/build/CMakeFiles/my_headers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/my_headers.dir/depend

