%{
#include "h.h"
%}
%option noyywrap
%option yylineno
%%
#[^\n]*		{}

print		TOC(PRINT)

[ \t\r\n]+	{}
%%
