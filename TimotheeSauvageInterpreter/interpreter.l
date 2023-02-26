%option noyywrap
%{
	#include<stdio.h>
	#include <string.h>

	#include "y.tab.h"
%}
blancs    [ \t]+
set	  "Set"
print     "print"
fin       "FIN"
or	  "OR"
and	  "AND"
xor	  "XOR"
not	  "NOT"

sin "sin"
cos "cos"


boolT      [bB][oO][oO][lL]
intT       [iI][nN][tT]
floatT     [fF][lL][oO][aA][tT]

false     [fF][aA][lL][sS][eE]
true      [tT][rR][uU][eE]

chiffre    [0-9]
entier	   {chiffre}+

decimal	  {entier}\.{entier}

identifier [a-zA-Z]([a-zA-Z0-9]|"?"|"$")*
commentaire #.* 


%%
{blancs}  { }
{commentaire} {}
{fin} {return(FIN);}

{or} {return(OR);}
{and} {return(AND);}
{xor} {return(XOR);}
{not} {return(NOT);}

{cos} {return(COS);}
{sin} {return(SIN);}

{set} {return(SET);}
{print} {return(PRINT);}
{true}  {
	yylval.intval = 1;
	return(TRUE);
}

{false}  {
	yylval.intval = 0;
	return(FALSE);
}
{entier}    {

      yylval.intval =atoi(yytext);
      return(ENTIER);
    }

{floatT} {
	yylval.tval = "f";
	return(FLOAT_T);
}

{decimal}	{
	yylval.floatval = atof(yytext);
	return(DECIMAL);
    }

{boolT} {
	yylval.tval = "b";
	return(BOOL_T);
}
{intT} {
	yylval.tval = "i";
	return(INT_T);
}

{identifier} {
	yylval.idval = strdup(yytext);
	return(IDENTIFIER);
}
"\n" return 0;
"+"   return(PLUS);
"-"   return(MOINS);
"*"   return(FOIS);
"/"   return(DIVISE);
"("   return(PARENTHESE_GAUCHE);
")"   return(PARENTHESE_DROITE);
"="   return(EQUAL);
";" return EOL;


.  {return yytext[0] ;} /* Tout le reste est renvoyé au parser */
