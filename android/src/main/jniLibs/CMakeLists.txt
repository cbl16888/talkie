

cmake_minimum_required(VERSION 3.18.1)

set(CMAKE_CXX_STANDARD 14)

project("flutter_talkie_codec")

include_directories(include)


add_library(
             flutter_talkie_codec
             SHARED
        flutter_talkie_codec.cpp)


set(LIB_DIR "${CMAKE_SOURCE_DIR}/${ANDROID_ABI}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -L${LIB_DIR}")

find_library(
              log-lib
              log )

# talkie
add_library(talkie SHARED IMPORTED)
set_target_properties(talkie PROPERTIES IMPORTED_LOCATION "${LIB_DIR}/libtalkie.so")

target_link_libraries(
        flutter_talkie_codec
                       talkie
                       ${log-lib}
                       )