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
CMAKE_SOURCE_DIR = /home/ahsanbasyar/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ahsanbasyar/catkin_ws/build

# Include any dependencies generated for this target.
include mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/depend.make

# Include the progress variables for this target.
include mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/progress.make

# Include the compile flags for this target's objects.
include mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/flags.make

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.o: mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/flags.make
mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.o: /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/geometric_controller.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahsanbasyar/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.o"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.o -c /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/geometric_controller.cpp

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.i"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/geometric_controller.cpp > CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.i

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.s"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/geometric_controller.cpp -o CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.s

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.o: mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/flags.make
mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.o: /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/nonlinear_attitude_control.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahsanbasyar/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.o"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.o -c /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/nonlinear_attitude_control.cpp

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.i"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/nonlinear_attitude_control.cpp > CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.i

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.s"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/nonlinear_attitude_control.cpp -o CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.s

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.o: mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/flags.make
mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.o: /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/nonlinear_geometric_control.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahsanbasyar/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.o"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.o -c /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/nonlinear_geometric_control.cpp

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.i"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/nonlinear_geometric_control.cpp > CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.i

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.s"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/nonlinear_geometric_control.cpp -o CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.s

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.o: mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/flags.make
mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.o: /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/jerk_tracking_control.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahsanbasyar/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.o"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.o -c /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/jerk_tracking_control.cpp

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.i"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/jerk_tracking_control.cpp > CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.i

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.s"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller/src/jerk_tracking_control.cpp -o CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.s

# Object files for target geometric_controller
geometric_controller_OBJECTS = \
"CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.o" \
"CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.o" \
"CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.o" \
"CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.o"

# External object files for target geometric_controller
geometric_controller_EXTERNAL_OBJECTS =

/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/geometric_controller.cpp.o
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_attitude_control.cpp.o
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/nonlinear_geometric_control.cpp.o
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/src/jerk_tracking_control.cpp.o
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/build.make
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libdynamic_reconfigure_config_init_mutex.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libtf.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libmavros.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libGeographic.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libdiagnostic_updater.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libeigen_conversions.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/liborocos-kdl.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libmavconn.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libclass_loader.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libPocoFoundation.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libdl.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libroslib.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/librospack.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libpython3.8.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.71.0
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libtf2_ros.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libactionlib.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libmessage_filters.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libtf2.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libroscpp.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/librosconsole.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/librostime.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /opt/ros/noetic/lib/libcpp_common.so
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so: mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ahsanbasyar/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library /home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so"
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/geometric_controller.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/build: /home/ahsanbasyar/catkin_ws/devel/lib/libgeometric_controller.so

.PHONY : mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/build

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/clean:
	cd /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller && $(CMAKE_COMMAND) -P CMakeFiles/geometric_controller.dir/cmake_clean.cmake
.PHONY : mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/clean

mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/depend:
	cd /home/ahsanbasyar/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahsanbasyar/catkin_ws/src /home/ahsanbasyar/catkin_ws/src/mavros_controllers/geometric_controller /home/ahsanbasyar/catkin_ws/build /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller /home/ahsanbasyar/catkin_ws/build/mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : mavros_controllers/geometric_controller/CMakeFiles/geometric_controller.dir/depend

