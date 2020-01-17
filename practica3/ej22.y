/* ej22.y fichero para la practica 3 de Teoria de la Computacion 2017/18 */
%{
#include <stdio.h>
int ToBinary(int decimal){
	if(decimal<2){
		return decimal;
	}
	else{
		return decimal % 2 + (10*ToBinary(decimal/2));
	}
}	
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token BINARY NOTB
%%

calclist : /* nada */
	| calclist exp NOTB EOL { printf("=%d\n", $2); }
	| calclist exp BINARY EOL { printf("=%d\n", ToBinary($2)); }
	;
exp : 	factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	| exp ADD NUMBER { $$ = $1 + $3; }
	| exp SUB NUMBER { $$ = $1 - $3; }
	| NUMBER { $$ = $1; }	
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple MUL factorsimple { $$ = $1 * $3; }
		| factorsimple DIV factorsimple { $$ = $1 / $3; }
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
main() {
  yyparse();
}

