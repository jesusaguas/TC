/* calcMejor.y fichero para la practica 3 de Teoria de la Computacion 2017/18 */
%{
#define YYSTYPE char*
#include <stdio.h>
//char* [10];
// Para que acabe el parse de golpe -->     {return(yyerror("Syntax error"))}
%}
%start CMMS
%token ADD SUB MUL DIV
%token Y O
%token MAYOR IGUAL ASIG
%token PC OP CP OL CL
%token FLOAT
%token VAR
%token NUMBER
%token IF DO WHILE
%%

CMMS : /* nada */
	| CMMS instruccion	{ printf("Bien TT BIEEEENNN"); }
	;
instruccion : 	FLOAT VAR ASIG NUMBER PC
	| FLOAT VAR ASIG VAR PC		
	;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
main() {
  yyparse();
}

