%{
	#include <stdio.h>
	 int caract = 0;
	 int lineas = 0;
	 int v=0;
	 int max=0;
	 int num=0;
	
%}

%%
[0-9]+		{num++; v++; caract = caract + yyleng;}
[a-zA-Z ]+	{v++; caract = caract + yyleng;if(yyleng>max){max= yyleng;}}
,			{caract++;}
\n		    {lineas++;} 



%%

int main(){
	yylex();
	printf("Salida:\nC: %d\nL: %d\nV: %d\nM: %d\nN: %d\n",caract, lineas, v, max, num);
}	
