# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_SOURCE_DIR = /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dmskhs0912/afl_project/FlightCrew/flightcrew

# Include any dependencies generated for this target.
include src/googlemock/gtest/CMakeFiles/gtest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/googlemock/gtest/CMakeFiles/gtest.dir/compiler_depend.make

# Include the progress variables for this target.
include src/googlemock/gtest/CMakeFiles/gtest.dir/progress.make

# Include the compile flags for this target's objects.
include src/googlemock/gtest/CMakeFiles/gtest.dir/flags.make

src/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o: src/googlemock/gtest/CMakeFiles/gtest.dir/flags.make
src/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o: /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/googlemock/gtest/src/gtest-all.cc
src/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o: src/googlemock/gtest/CMakeFiles/gtest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dmskhs0912/afl_project/FlightCrew/flightcrew/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o"
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/googlemock/gtest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o -MF CMakeFiles/gtest.dir/src/gtest-all.cc.o.d -o CMakeFiles/gtest.dir/src/gtest-all.cc.o -c /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/googlemock/gtest/src/gtest-all.cc

src/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gtest.dir/src/gtest-all.cc.i"
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/googlemock/gtest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/googlemock/gtest/src/gtest-all.cc > CMakeFiles/gtest.dir/src/gtest-all.cc.i

src/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gtest.dir/src/gtest-all.cc.s"
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/googlemock/gtest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/googlemock/gtest/src/gtest-all.cc -o CMakeFiles/gtest.dir/src/gtest-all.cc.s

# Object files for target gtest
gtest_OBJECTS = \
"CMakeFiles/gtest.dir/src/gtest-all.cc.o"

# External object files for target gtest
gtest_EXTERNAL_OBJECTS =

lib/libgtest.a: src/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
lib/libgtest.a: src/googlemock/gtest/CMakeFiles/gtest.dir/build.make
lib/libgtest.a: src/googlemock/gtest/CMakeFiles/gtest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dmskhs0912/afl_project/FlightCrew/flightcrew/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../../../lib/libgtest.a"
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/googlemock/gtest && $(CMAKE_COMMAND) -P CMakeFiles/gtest.dir/cmake_clean_target.cmake
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/googlemock/gtest && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gtest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/googlemock/gtest/CMakeFiles/gtest.dir/build: lib/libgtest.a
.PHONY : src/googlemock/gtest/CMakeFiles/gtest.dir/build

src/googlemock/gtest/CMakeFiles/gtest.dir/clean:
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/googlemock/gtest && $(CMAKE_COMMAND) -P CMakeFiles/gtest.dir/cmake_clean.cmake
.PHONY : src/googlemock/gtest/CMakeFiles/gtest.dir/clean

src/googlemock/gtest/CMakeFiles/gtest.dir/depend:
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2 /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/googlemock/gtest /home/dmskhs0912/afl_project/FlightCrew/flightcrew /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/googlemock/gtest /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/googlemock/gtest/CMakeFiles/gtest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/googlemock/gtest/CMakeFiles/gtest.dir/depend

