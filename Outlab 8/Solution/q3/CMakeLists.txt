cmake_minimum_required(VERSION 2.8.12)
project(my_project)


set(CMAKE_CXX_STANDARD 11)

add_executable(helloworld helloworld.cpp)
add_executable(usespthread usespthread.cpp)
target_link_libraries(usespthread PRIVATE -lpthread)

add_library(MyEngineStatic STATIC myengine/myengine.hpp myengine/myengine.cpp)
add_library(MyEngineDynamic SHARED myengine/myengine.hpp myengine/myengine.cpp)

set_target_properties(MyEngineStatic PROPERTIES PUBLIC_HEADER "myengine/myengine.hpp")
install(TARGETS MyEngineStatic DESTINATION lib PUBLIC_HEADER DESTINATION include)
set_target_properties(MyEngineDynamic PROPERTIES PUBLIC_HEADER "myengine/myengine.hpp")
install(TARGETS MyEngineDynamic DESTINATION lib PUBLIC_HEADER DESTINATION include)

add_custom_target(installl
	COMMAND cp libMyEngineStatic.a /usr/local/lib
	COMMAND ldconfig -n -v /usr/local/lib
	COMMAND cp libMyEngineDynamic.so /usr/local/lib
	COMMAND ldconfig -n -v /usr/local/lib
	COMMAND cp ../myengine/myengine.hpp /usr/local/include
	)
