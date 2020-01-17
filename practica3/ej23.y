/* ej23.y fichero para la practica 3 de Teoria de la Computacion 2017/18 */
%{
#include <stdio.h>
int acum=0;
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token ACUM NEWACUM
%%

calclist : /* nada */
	| calclist exp EOL { printf("=%d\n", $2); }
	| calclist NEWACUM exp EOL { acum = $3; }
	;
exp : 	factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	| exp ADD NUMBER { $$ = $1 + $3; }
	| exp SUB NUMBER { $$ = $1 - $3; }
	| exp ADD ACUM { $$ = $1 + $3; }
	| exp SUB ACUM { $$ = $1 - $3; }
	| NUMBER { $$ = $1; }	
	| ACUM { $$ = acum; }
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple MUL factorsimple { $$ = $1 * $3; }
		| factorsimple DIV factorsimple { $$ = $1 / $3; }
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER
		| ACUM { $$ = acum; }
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
main() {
  yyparse();
}

