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

# Utility rule file for makeinstaller.

# Include any custom commands dependencies for this target.
include src/FlightCrew-gui/CMakeFiles/makeinstaller.dir/compiler_depend.make

# Include the progress variables for this target.
include src/FlightCrew-gui/CMakeFiles/makeinstaller.dir/progress.make

src/FlightCrew-gui/CMakeFiles/makeinstaller:
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/FlightCrew-gui && cmake -E echo For\ this\ to\ work,\ InstallJammer\ needs\ to\ be\ installed\ and\ on\ the\ system\ path.
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/FlightCrew-gui && installjammer -DBaseDir /home/dmskhs0912/afl_project/FlightCrew/flightcrew/temp_folder/FlightCrew -DFCMajorVersion 0 -DFCMinorVersion 9 -DFCRevisionVersion 1 --platform Linux-x86_64 --output-dir /home/dmskhs0912/afl_project/FlightCrew/flightcrew/installer --build-for-release --verbose --build /home/dmskhs0912/afl_project/FlightCrew/flightcrew/temp_folder/FlightCrew.mpi

makeinstaller: src/FlightCrew-gui/CMakeFiles/makeinstaller
makeinstaller: src/FlightCrew-gui/CMakeFiles/makeinstaller.dir/build.make
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Removing temporary directory..."
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/FlightCrew-gui && cmake -E remove_directory /home/dmskhs0912/afl_project/FlightCrew/flightcrew/temp_folder
.PHONY : makeinstaller

# Rule to build all files generated by this target.
src/FlightCrew-gui/CMakeFiles/makeinstaller.dir/build: makeinstaller
.PHONY : src/FlightCrew-gui/CMakeFiles/makeinstaller.dir/build

src/FlightCrew-gui/CMakeFiles/makeinstaller.dir/clean:
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/FlightCrew-gui && $(CMAKE_COMMAND) -P CMakeFiles/makeinstaller.dir/cmake_clean.cmake
.PHONY : src/FlightCrew-gui/CMakeFiles/makeinstaller.dir/clean

src/FlightCrew-gui/CMakeFiles/makeinstaller.dir/depend:
	cd /home/dmskhs0912/afl_project/FlightCrew/flightcrew && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2 /home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/src/FlightCrew-gui /home/dmskhs0912/afl_project/FlightCrew/flightcrew /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/FlightCrew-gui /home/dmskhs0912/afl_project/FlightCrew/flightcrew/src/FlightCrew-gui/CMakeFiles/makeinstaller.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/FlightCrew-gui/CMakeFiles/makeinstaller.dir/depend

