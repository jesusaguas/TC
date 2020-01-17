/* ej3.l fichero para la practica 3 de Teoria de la Computacion 2017/18 */
%{
#include "y.tab.h"
%}
%%
"x"	{return(X);}
"y"	{return(Y);}
"z"	{return(Z);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
