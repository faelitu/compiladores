%{
	int conta = 1;
%}
%%
[#][a-zA-Z0-9\-._]+	printf("%d - %s\n", conta, yytext);
.			;
\n			conta++;
%%
int yywrap() {return 1;}
int main() {
	yylex();
}
