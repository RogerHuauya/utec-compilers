%{
#include <cstdlib>
#include "Parser.hpp"
using namespace calc;
%}

%option reentrant interactive noyywrap noyylineno nodefault outfile="Scanner.cpp" header="Scanner.hpp"
dseq            ([[:digit:]]+)
integer         ({dseq})


%%

{integer}   yylval->emplace<int>(strtoll(yytext, nullptr, 10)); return Parser::token::INT;
"+"         return Parser::token::PLUS;
"-"         return Parser::token::MINUS;
"*"         return Parser::token::MULT;
"/"         return Parser::token::DIV;
"("         return Parser::token::LPAREN;
")"         return Parser::token::RPAREN;
\n          return Parser::token::EOL;
<<EOF>>     return Parser::token::YYEOF;
.           std::cout<< "Caracter invalido";

%%

int main() {

    FILE *fp;
    fp = fopen("ejemplo.txt", "r");
    void* scanner;
    yylex_init(&scanner);
    yyset_in(fp, scanner);
    calc::Parser parser(scanner);
    std::cout.precision(10);
    parser.parse();
    yylex_destroy(scanner);
}