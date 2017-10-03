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

"se" 			{escreva("Palavra reservada if", yytext()); }
"senao"			{escreva("Palavra reservada senao ", yytext());}
"escreva"		{escreva("Função de imprimir", yytext());}
"receba"		{escreva("Função de receber ", yytext());}
"enquanto"		{escreva("Palavra reservada enquanto", yytext());}

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


. { throw new RuntimeException("Caractere inválido " + yytext()); }