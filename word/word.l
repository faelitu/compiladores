%{
	int c, w, l;
%}
%%
\n		{l++; c++;}
[^ \t\n]+	{w++; c = c + yyleng;}
.		{c++;}
%%
int yywrap() { return 1; }
int main() {
	yylex();
	printf ("%d\t%d\t%d\n", l, w, c);
}
