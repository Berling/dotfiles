#!/bin/bash
project_name=$1
module_name=$2
cmake_lists=$module_name/CMakeLists.txt
mode=$3
mkdir $module_name
mkdir -p $module_name/include/$project_name/$module_name
mkdir $module_name/src
touch $cmake_lists
echo "project($module_name VERSION 0.0.0 LANGUAGES CXX)" >> $cmake_lists
echo >> $cmake_lists
echo "add_$mode($module_name)" >> $cmake_lists
echo >> $cmake_lists
echo "target_include_directories($module_name PUBLIC" >> $cmake_lists
echo -e "\t\$<BUILD_INTERFACE:\${CMAKE_CURRENT_SOURCE_DIR}/include>" >> $cmake_lists
echo -e "\tPRIVATE src)" >> $cmake_lists
echo >> $cmake_lists
echo "target_compile_options($module_name PUBLIC" >> $cmake_lists
echo -e "\t\$<\$<OR:\$<CXX_COMPILER_ID:GNU>,\$<CXX_COMPILER_ID:Clang>>:-std=c++1z -Wall -Wextra -Werror>" >> $cmake_lists
echo -e "\t\$<\$<CXX_COMPILER_ID:Clang>:-stdlib=libc++>)" >> $cmake_lists
echo >> $cmake_lists
echo "target_link_libraries($module_name" >> $cmake_lists
echo -e "\t\$<\$<CXX_COMPILER_ID:Clang>:c++>)" >> $cmake_lists
echo >> $cmake_lists
echo "export(TARGETS $module_name FILE $module_name.cmake)" >> $cmake_lists
