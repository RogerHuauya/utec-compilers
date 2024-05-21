cmake_minimum_required(VERSION 3.28)
project(utec_compilers)

set(CMAKE_CXX_STANDARD 17)

add_executable(lab7-1 lab7-1/exp.cpp lab7-1/exp_parser.cpp lab7-1/exp_test.cpp)
add_executable(lab7-2 lab7-2/ast_evaluator.cpp lab7-2/ast_printer.cpp lab7-2/ast_visitor.cpp lab7-2/exp.cpp lab7-2/exp_parser.cpp)
add_executable(lab8-1 lab8-1/environment.cpp lab8-1/imp.cpp
        lab8-1/imp_interpreter.cpp lab8-1/imp_parser.cpp lab8-1/imp_printer.cpp
        lab8-1/imp_test.cpp)
