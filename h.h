#ifndef _H_VASIC
#define _H_VASIC

#include <stdlib.h>
#include <stdio.h>

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(X) { yylval.s=yytext; return X; }
extern int yyparse();
extern void yyerror(char*);
#include "y.tab.h"

#endif /* _H_VASIC */
