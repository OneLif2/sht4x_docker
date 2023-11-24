cmake_minimum_required(VERSION 3.4...3.18)
project(sht4x)
message(STATUS "CMAKE_PROJECT_NAME" "${CMAKE_PROJECT_NAME}")
message(STATUS "PROJECT_SOURCE_DIR" "${PROJECT_SOURCE_DIR}")

set(LIB_DIR "${PROJECT_SOURCE_DIR}/raspberry-pi-i2c-sht4x")

add_subdirectory(pybind11)
set(MAIN_DIR "${PROJECT_SOURCE_DIR}")
message(STATUS "MAIN_DIR = " "${MAIN_DIR}")

add_library(my_headers ${LIB_DIR})
target_include_directories(my_headers PUBLIC raspberry-pi-i2c-sht4x)
set_target_properties(my_headers PROPERTIES LINKER_LANGUAGE CXX)

add_library(my_lib 
${LIB_DIR}/sensirion_common.c
${LIB_DIR}/sensirion_i2c_hal.c
${LIB_DIR}/sensirion_i2c.c
${LIB_DIR}/sht4x_i2c.c
)

message(STATUS "build importable .so file")
pybind11_add_module(sht4x sht4x_i2c_pybind11.cpp)

target_link_libraries(sht4x PUBLIC my_lib my_headers)
