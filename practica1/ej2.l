%{
	#include <stdio.h>
	 int cont = 0;
	
%}

%%
@hotmail		{printf("%s", yytext); cont++;}



%%

int main(){
	yylex();
	printf("Total de usuarios: %d\n",cont);
}	
