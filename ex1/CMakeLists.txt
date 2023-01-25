cmake_minimum_required (VERSION 3.12)

project (ex1)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -fPIC -Werror=return-type")

add_executable(${PROJECT_NAME} main.cpp)