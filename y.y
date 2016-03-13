%{
#include "h.h"
%}
%defines %union { char*s; long long i; double f; }
%token <s> PRINT
%token <s> SYM STR NUM
%type <s> ex scalar
%%
REPL : | REPL ex { printf("<%s>",$2); }
	| REPL PRINT ex { printf("<print:%s>",$3); }
;
ex : scalar ;
scalar : SYM | STR | NUM ;
%%
