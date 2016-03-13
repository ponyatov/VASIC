%{
#include "h.h"
%}
%defines %union { char*s; }
%token <s> PRINT STR
%type <s> ex
%%
REPL : | REPL ex { printf("<%s>",$2); } ;
ex : PRINT | STR ;
%%
