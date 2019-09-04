%{
	int nLinha = 1;
%}

identificador 	[a-zA-Z]([a-zA-Z0-9])*
numero		[0-9]+
espaco		[ \t]+
novalinha	[\n]

%x comentario

%%

programa	printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);
inicio		printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);
fimprograma	printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);

leia		printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);
escreva		printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);

se		printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);
entao		printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);
senao		printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);
fimse		printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);

enquanto	printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);
faca		printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);
fimenquanto	printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);

"+"		printf("Linha=%2d>%12s: operador aritmetico soma\n", nLinha, yytext);
"-"		printf("Linha=%2d>%12s: operador aritmetico subtracao\n", nLinha, yytext);
"*"		printf("Linha=%2d>%12s: operador aritmetico multiplicacao\n", nLinha, yytext);
div		printf("Linha=%2d>%12s: operador aritmetico divisao\n", nLinha, yytext);

">"		printf("Linha=%2d>%12s: operador relacional maior\n", nLinha, yytext);
"<"		printf("Linha=%2d>%12s: operador relacional menor\n", nLinha, yytext);
"="		printf("Linha=%2d>%12s: operador relacional igual\n", nLinha, yytext);

e		printf("Linha=%2d>%12s: operador logico conjuncao\n", nLinha, yytext);
ou		printf("Linha=%2d>%12s: operador logico disjuncao\n", nLinha, yytext);
nao		printf("Linha=%2d>%12s: operador logico negacao\n", nLinha, yytext);

"<-"		printf("Linha=%2d>%12s: operador de atribuicao\n", nLinha, yytext);
"("		printf("Linha=%2d>%12s: simbolo abre parenteses\n", nLinha, yytext);
")"		printf("Linha=%2d>%12s: simbolo fecha parenteses\n", nLinha, yytext);

inteiro		printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);
logico		printf("Linha=%2d>%12s: palavra reservada\n", nLinha, yytext);
V		printf("Linha=%2d>%12s: constante logica de verdade\n", nLinha, yytext);
F		printf("Linha=%2d>%12s: constante logica de falsidade\n", nLinha, yytext);

{identificador}	printf("Linha=%2d>%12s: identificador\n", nLinha, yytext);
{numero}	printf("Linha=%2d>%12s: numero\n", nLinha, yytext);
{espaco}	/* nao faz nada */
{novalinha}	nLinha++;

"//".*		/* nao faz nada */

"/*"		BEGIN (comentario);
<comentario>[^*\n]*	/* nao faz nada */
<comentario>[*]+[^*/\n]	/* nao faz nada */
<comentario>\n		nLinha++;
<comentario>"*"+"/"	BEGIN (INITIAL);
.		printf("Linha=%2d>%12s: ERRO - SIMBOLO NAO RECONHECIDO!\n", nLinha, yytext);

%%

int yywrap(void) { return 1; }

int main (void) {
	yylex();
	return 0;
}
