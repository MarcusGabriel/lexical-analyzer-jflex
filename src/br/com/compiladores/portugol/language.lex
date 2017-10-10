package br.com.compiladores.portugol;

%%

%{

	private void escreva(String descricao, String lexema) {
		System.out.println(lexema + " - " + descricao);
	}
%}

%class LexicalAnalyzer

%type void

BRANCO 				= [\n| |\t|\r]
ID 					= [_|a-z|A-Z][a-z|A-Z|0-9|_]*
SOMA				= "+"
SUB					= "-"
MUL					= "*"
DIV				 	= "/"
INTEIRO 			= 0|[1-9][0-9]*
REAL				= (([0-9]+[.][0-9]*)|([0-9]*[.][0-9]+))
NOVALINHA			= [\n]
TEXTO				= ((['].[^\x]+[']) | ([\"].[^\x]+[\"]))



%%

"se" 			{escreva("Palavra reservada se", yytext()); }
"senao"			{escreva("Palavra reservada senao ", yytext());}
"escreva"		{escreva("Função de imprimir", yytext());}
"receba"		{escreva("Função de receber ", yytext());}
"enquanto"		{escreva("Palavra reservada enquanto", yytext());}
"fimenquanto" 	{escreva("Palavra reservada fimenquanto",yytext());}
"inteiro"		{escreva("Tipo de dado Inteiro", yytext());}
"real"			{escreva("Tipo de dado real", yytext() );}

"{"				{escreva("abrir chaves", yytext());}
"}"				{escreva("fechar chaves", yytext());}
";"				{escreva("Final de instrução", yytext());}
"("				{escreva("abrir parenteses", yytext());}
")"				{escreva("fechar parenteses", yytext());}
"["				{escreva("abrir colchetes", yytext());}
"]"				{escreva("fechar colchetes", yytext());}

{BRANCO} 		{escreva("Espaço em branco", yytext()); }
{ID} 			{escreva("Identificador", yytext()); }
{SOMA}			{escreva("Operador soma", yytext());}
{SUB}			{escreva("Operador subtracao", yytext());}
{MUL}			{escreva("Operador multiplicacao", yytext());}
{DIV}			{escreva("Operador divisao", yytext());}
{INTEIRO} 		{escreva("Número Inteiro", yytext()); }
{REAL}			{escreva("Número Real ",yytext());}
{NOVALINHA}		{escreva("\\n \t - \tnova linha escape");}
{TEXTO}			{escreva("Texto ", yytext());}


">"				{escreva("Operador maior", yytext());}
"<"				{escreva("Operador menor", yytext());}

">="			{escreva("Operador maior igual", yytext());}
"<="			{escreva("Operador menor igual", yytext());}

"=="			{escreva("Operador igualdade", yytext());}
"="				{escreva("Operador de atribuição", yytext());}

"++"			{escreva("Operador Incrementa", yytext());}
"--"			{escreva("Operador Decrementa", yytext());}

. { throw new RuntimeException("Caractere inválido " + yytext()); }