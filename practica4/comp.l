/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion 2017/18 */
%{
#include "y.tab.h"
%}

%x comentario

%%
"+"		{return(ADD);}
"-"		{return(SUB);}
"*"		{return(MUL);}
"/"		{return(DIV);}
"&&"	{return(Y);}
"||"	{return(O);}
">"		{return(MAYOR);}
"=="	{return(IGUAL);}
"="		{return(ASIG);}
";"		{return(PC);}
"("		{return(OP);}
")"		{return(CP);}
"{"		{return(OL);}
"}"		{return(CL);}

"float"	{return(FLOAT);}
[:alpha:][:alnum:]*		{/*yylval = strdup(yytext);*/ return(VAR);}
[0-9]+"."[0-9]*		{return(NUMBER);}
[0-9]*"."[0-9]+		{return(NUMBER);}
[0-9]+				{return(NUMBER);}

"if"		{return(IF);}
"do"		{return(DO);}
"while"		{return(WHILE);}


[[:blank:]]*	{}		//ignorar
\n				{}		//ignorar

"/*"					{BEGIN(comentario);}
<comentario>[^"*/"]
<comentario>"*/"		{BEGIN(INITIAL);}

%%
