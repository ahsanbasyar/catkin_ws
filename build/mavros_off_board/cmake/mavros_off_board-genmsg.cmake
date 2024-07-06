# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mavros_off_board: 1 messages, 0 services")

set(MSG_I_FLAGS "-Imavros_off_board:/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mavros_off_board_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg" NAME_WE)
add_custom_target(_mavros_off_board_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mavros_off_board" "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mavros_off_board
  "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mavros_off_board
)

### Generating Services

### Generating Module File
_generate_module_cpp(mavros_off_board
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mavros_off_board
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mavros_off_board_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mavros_off_board_generate_messages mavros_off_board_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg" NAME_WE)
add_dependencies(mavros_off_board_generate_messages_cpp _mavros_off_board_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mavros_off_board_gencpp)
add_dependencies(mavros_off_board_gencpp mavros_off_board_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mavros_off_board_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(mavros_off_board
  "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mavros_off_board
)

### Generating Services

### Generating Module File
_generate_module_eus(mavros_off_board
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mavros_off_board
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mavros_off_board_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mavros_off_board_generate_messages mavros_off_board_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg" NAME_WE)
add_dependencies(mavros_off_board_generate_messages_eus _mavros_off_board_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mavros_off_board_geneus)
add_dependencies(mavros_off_board_geneus mavros_off_board_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mavros_off_board_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mavros_off_board
  "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mavros_off_board
)

### Generating Services

### Generating Module File
_generate_module_lisp(mavros_off_board
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mavros_off_board
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mavros_off_board_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mavros_off_board_generate_messages mavros_off_board_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg" NAME_WE)
add_dependencies(mavros_off_board_generate_messages_lisp _mavros_off_board_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mavros_off_board_genlisp)
add_dependencies(mavros_off_board_genlisp mavros_off_board_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mavros_off_board_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(mavros_off_board
  "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mavros_off_board
)

### Generating Services

### Generating Module File
_generate_module_nodejs(mavros_off_board
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mavros_off_board
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mavros_off_board_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mavros_off_board_generate_messages mavros_off_board_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg" NAME_WE)
add_dependencies(mavros_off_board_generate_messages_nodejs _mavros_off_board_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mavros_off_board_gennodejs)
add_dependencies(mavros_off_board_gennodejs mavros_off_board_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mavros_off_board_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mavros_off_board
  "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mavros_off_board
)

### Generating Services

### Generating Module File
_generate_module_py(mavros_off_board
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mavros_off_board
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mavros_off_board_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mavros_off_board_generate_messages mavros_off_board_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/msg/Corners.msg" NAME_WE)
add_dependencies(mavros_off_board_generate_messages_py _mavros_off_board_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mavros_off_board_genpy)
add_dependencies(mavros_off_board_genpy mavros_off_board_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mavros_off_board_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mavros_off_board)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mavros_off_board
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mavros_off_board_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mavros_off_board)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mavros_off_board
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(mavros_off_board_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mavros_off_board)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mavros_off_board
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(mavros_off_board_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mavros_off_board)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mavros_off_board
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(mavros_off_board_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mavros_off_board)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mavros_off_board\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mavros_off_board
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mavros_off_board_generate_messages_py std_msgs_generate_messages_py)
endif()
