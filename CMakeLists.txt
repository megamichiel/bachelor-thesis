cmake_minimum_required(VERSION 3.20)
project(Thesis C)

set(CMAKE_C_STANDARD 99)
SET(CMAKE_C_FLAGS "-O3")

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

include_directories(include)
include_directories(src)
include_directories(src/tests)

#add_executable(Thesis_normal src/types.c src/impl_normal.c src/main.c)
add_executable(Thesis_compact src/types.c src/ops_seq.c src/ops_bulk.c src/ops_basic.c src/tests/tests.c src/main.c)

#target_compile_definitions(Thesis_normal PUBLIC IMPL__NORMAL)
target_compile_definitions(Thesis_compact PUBLIC IMPL__COMPACT)

target_compile_definitions(Thesis_compact PUBLIC REDUNDANT_BITS=0)

#target_link_libraries(Thesis_normal PRIVATE Threads::Threads)
target_link_libraries(Thesis_compact PRIVATE Threads::Threads)
