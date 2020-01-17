%{
	//Autor: Jesus Aguas Acin 
	#include <stdio.h>
	int cpp = 0;
	int java = 0;
	int vecesDato = 0;
	int vecesInclude = 0;
	int vecesImport = 0;
	int vecesString = 0;
%}



%%


"#include"					{vecesInclude++; if(vecesInclude==1){cpp+=10;};}
[[:blank:]]*import			{vecesImport++; if(vecesImport==1){java+=10;};} 
String[ a-zA-Z0-9_]*		{vecesString++; if (vecesString<=5) {java++;};}
(int|float|char)[[:blank:]]*"&"[[:blank:]]*[[:alpha:]_]+[[:alnum:]_]+				{vecesDato++; if (vecesDato<=5) {cpp++;};}
"//".*						{}								//comentario
"/*"(.*\n*)*"*/"			{}								//comentario
"\""(.*\n*)*"\""	
.|\n						{}

%%

int main(){
	yylex();
	printf("PJ: %d\n",java);
	printf("PC: %d\n",cpp);
	if (cpp>=java){
		printf("CLASIFICADO: C++\n");
	}
	else{
		printf("CLASIFICADO: JAVA\n");
	}
}	
