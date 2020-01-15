%{
	#include <stdio.h>
	
%}

%%
[01]*					{printf("%s", yytext);}
[0-9]*[02468][480]		{printf("%s", yytext); printf("(MULTIPLO4)"); }
[0-9]*[13579][26]		{printf("%s", yytext); printf("(MULTIPLO4)"); }
[^0-9][48][^0-9]		{printf("%s", yytext); printf("(MULTIPLO4)"); }

%%

