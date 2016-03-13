%{
#include "h.h"
%}
%defines %union { char*s; }
%token <s> PRINT STR
%type <s> ex
%%
REPL : | REPL ex { printf("\n\n%s\n\n",$2); } ;
ex : PRINT | STR ;
%%
