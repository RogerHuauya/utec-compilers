%{
#include <iostream>
#include <string>
#include <cmath>
#include "Scanner.hpp"
%}

%require "3.7.4"
%language "C++"
%defines "Parser.hpp"
%output "Parser.cpp"

%define api.parser.class {Parser}
%define api.namespace {calc}
%define api.value.type variant
%param {yyscan_t scanner}

%code provides
{
    #define YY_DECL \
        int yylex(calc::Parser::semantic_type *yylval, yyscan_t yyscanner)
    YY_DECL;
}

%token EOL LPAREN RPAREN
%token <int> INT

%right PLUS MINUS
%left MULT DIV



%nterm <int>  iexp


%%

lines   : %empty
        | lines line
        ;

line    : EOL
        | iexp EOL         { std::cout << "Resultado:" <<  $1 << '\n'; }
        | error EOL        { yyerrok; }
        ;

iexp    : INT              { $$ = $1; }
        | iexp PLUS iexp   { $$ = $1+$3; }
        | iexp MINUS iexp  { $$ = $1-$3; }
        | iexp MULT iexp   { $$ = $1*$3; }
        | iexp DIV iexp    { $$ = $1/$3; }
        ;

%%

void calc::Parser::error(const std::string& msg) {
    std::cerr << msg << '\n';
}