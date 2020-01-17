/* ej21.l fichero para la practica 3 de Teoria de la Computacion 2017/18 */
%{
#include "y.tab.h"
int binary = 0;
int ToDecimal(int binary){
	if(binary<2){
		return binary;
	}
	else{
		return binary % 2 + (2*ToDecimal(binary/10));
	}
}
%}

%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[01]+"b"	{binary=atoi(yytext); yylval=ToDecimal(binary); return(NUMBER);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
