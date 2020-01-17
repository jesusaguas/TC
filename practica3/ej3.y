/* ej3.y fichero para la practica 3 de Teoria de la Computacion 2017/18 */
%{
#include <stdio.h>
%}
%token X Y Z EOL 
%start S
%%

S : /*nada*/
	| EOL
	| C X S
	;
B : X C Y
	| X C
	;
C : X B X
	| Z
	;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
main() {
  yyparse();
}

