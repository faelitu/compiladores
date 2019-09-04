identificador 	[a-zA-Z]([a-zA-Z0-9])*
numero		[0-9]+
espaco		[ \t]+
novalinha	[\n]

%%

programa	printf("%11s: palavra reservada\n", yytext);
inicio		printf("%11s: palavra reservada\n", yytext);
fimprograma	printf("%11s: palavra reservada\n", yytext);

leia		printf("%11s: palavra reservada\n", yytext);
escreva		printf("%11s: palavra reservada\n", yytext);

se		printf("%11s: palavra reservada\n", yytext);
entao		printf("%11s: palavra reservada\n", yytext);
senao		printf("%11s: palavra reservada\n", yytext);
fimse		printf("%11s: palavra reservada\n", yytext);

enquanto	printf("%11s: palavra reservada\n", yytext);
faca		printf("%11s: palavra reservada\n", yytext);
fimenquanto	printf("%11s: palavra reservada\n", yytext);

"+"		printf("%11s: operador aritmetico soma\n", yytext);
"-"		printf("%11s: operador aritmetico subtracao\n", yytext);
"*"		printf("%11s: operador aritmetico multiplicacao\n", yytext);
div		printf("%11s: operador aritmetico divisao\n", yytext);

">"		printf("%11s: operador relacional maior\n", yytext);
"<"		printf("%11s: operador relacional menor\n", yytext);
"="		printf("%11s: operador relacional igual\n", yytext);

e		printf("%11s: operador logico conjuncao\n", yytext);
ou		printf("%11s: operador logico disjuncao\n", yytext);
nao		printf("%11s: operador logico negacao\n", yytext);

"<-"		printf("%11s: operador de atribuicao\n", yytext);
"("		printf("%11s: simbolo abre parenteses\n", yytext);
")"		printf("%11s: simbolo fecha parenteses\n", yytext);

inteiro		printf("%11s: palavra reservada\n", yytext);
logico		printf("%11s: palavra reservada\n", yytext);
V		printf("%11s: constante logica de verdade\n", yytext);
F		printf("%11s: constante logica de falsidade\n", yytext);

{identificador}	printf("%11s: identificador\n", yytext);
{numero}	printf("%11s: numero\n", yytext);
{espaco}	/* nao faz nada */
{novalinha}	/* nao faz nada */
.		printf("%11s: ERRO - SIMBOLO NAO RECONHECIDO!\n", yytext);

%%

int yywrap(void) { return 1; }

int main (void) {
	yylex();
	return 0;
}
