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

# Utility rule file for gccPCH_fc.

# Include any custom commands dependencies for this target.
include src/FlightCrew/CMakeFiles/gccPCH_fc.dir/compiler_depend.make

# Include the progress variables for this target.
include src/FlightCrew/CMakeFiles/gccPCH_fc.dir/progress.make

src/FlightCrew/CMakeFiles/gccPCH_fc: src/FlightCrew/stdafx.h.gch

src/FlightCrew/stdafx.h.gch: /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/FlightCrew/stdafx.h
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/dmskhs0912/afl_project/FlightCrew/flightcrew/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating stdafx.h.gch"
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/FlightCrew && /usr/bin/c++ -O3 -DNDEBUG -I/home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/BoostParts -I/home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/Xerces -I/home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/zipios /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/FlightCrew/stdafx.h -o stdafx.h.gch

gccPCH_fc: src/FlightCrew/CMakeFiles/gccPCH_fc
gccPCH_fc: src/FlightCrew/stdafx.h.gch
gccPCH_fc: src/FlightCrew/CMakeFiles/gccPCH_fc.dir/build.make
.PHONY : gccPCH_fc

# Rule to build all files generated by this target.
src/FlightCrew/CMakeFiles/gccPCH_fc.dir/build: gccPCH_fc
.PHONY : src/FlightCrew/CMakeFiles/gccPCH_fc.dir/build

src/FlightCrew/CMakeFiles/gccPCH_fc.dir/clean:
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/FlightCrew && $(CMAKE_COMMAND) -P CMakeFiles/gccPCH_fc.dir/cmake_clean.cmake
.PHONY : src/FlightCrew/CMakeFiles/gccPCH_fc.dir/clean

src/FlightCrew/CMakeFiles/gccPCH_fc.dir/depend:
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2 /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/FlightCrew /home/dmskhs0912/afl_project/FlightCrew/flightcrew /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/FlightCrew /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/FlightCrew/CMakeFiles/gccPCH_fc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/FlightCrew/CMakeFiles/gccPCH_fc.dir/depend

