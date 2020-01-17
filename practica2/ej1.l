%{
	//Autor: Jesus Aguas Acin
	char* nombreVirus;

%}


%x virus



%%


[^=]+	{nombreVirus=strdup(yytext);}
"="		{BEGIN(virus);}
<virus>[0-9a-fA-F][0-9a-fA-F]	{printf("\\x%s",yytext);}							
<virus>\n		{BEGIN(INITIAL); 	printf(" {printf(\"");	
									printf("%s",nombreVirus);	
									printf("\");}\n");}
				
%%

int main(){
	printf("%c%c\n\n", '%','%');
	yylex();
	printf("%c%c\n\n", '%','%');

	return 0;
}
