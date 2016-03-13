#include "h.h"

void yyerror(char* msg) {
	fprintf(stderr,"\n\n%i:%s[%s]\n\n",yylineno,msg,yytext);
	exit(-1);
}

int main() { return yyparse(); }
