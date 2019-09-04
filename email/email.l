%%
[a-z0-9.\-_]+"@"[a-z0-9.]+ 	printf("%s\n", yytext);
.				;
\n				;
%%
int yywrap() { return 1; }
int main() {
	yylex();
}
