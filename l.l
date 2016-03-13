%{
#include "h.h"
char LexString[0x10]; int LexPtr;
%}
%option noyywrap
%option yylineno
%x lexstring
%%
#[^\n]*		{}

'				{BEGIN(lexstring); LexPtr=0;}
<lexstring>'	{BEGIN(INITIAL); LexString[LexPtr]='\0';
				yylval.s = (char*)strdup(LexString); return STR;}
<lexstring>.	{LexString[LexPtr++]=yytext[0];
				assert(LexPtr<sizeof(LexString));}

print			TOCS(PRINT)

[a-zA-Z0-9_.]+	TOCS(SYM)

%%
