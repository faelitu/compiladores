%{
	int num =0;
%}
%%
^(.*)\n	printf("%4d\t%s", ++num, yytext);
%%
int yywrap() { return 1;}
int main (int argc, char *argv[]) {
	yyin = fopen (argv[1], "rt");
	yylex();
	fclose(yyin);
}
