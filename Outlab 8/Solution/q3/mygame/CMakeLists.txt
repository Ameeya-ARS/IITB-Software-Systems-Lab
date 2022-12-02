cmake_minimum_required(VERSION 3.16.3)

set(CMAKE_C_COMPILER "/usr/bin/gcc")
set(CMAKE_CXX_COMPILER "/usr/bin/g++")
project(my_game)

add_executable(mygamestatic mygame.cpp)
target_link_libraries(mygamestatic PRIVATE MyEngineStatic)

add_executable(mygamedynamic mygame.cpp)
target_link_libraries(mygamedynamic PRIVATE MyEngineDynamic)
set_target_properties(mygamedynamic PROPERTIES
        BUILD_WITH_INSTALL_RPATH FALSE
        LINK_FLAGS "-Wl,-rpath,/usr/local/lib")
