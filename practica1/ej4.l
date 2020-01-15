%{

int num=0;

%}


%%

[0-9] { num=atoi(yytext); printf("%d",num+1);}

"\n" { printf("\n\n");}

%%
