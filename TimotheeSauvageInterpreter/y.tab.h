/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TRUE = 258,
     FALSE = 259,
     BOOL_T = 260,
     ENTIER = 261,
     INT_T = 262,
     DECIMAL = 263,
     FLOAT_T = 264,
     IDENTIFIER = 265,
     SET = 266,
     EOL = 267,
     PRINT = 268,
     FIN = 269,
     PLUS = 270,
     MOINS = 271,
     FOIS = 272,
     DIVISE = 273,
     EQUAL = 274,
     PARENTHESE_GAUCHE = 275,
     PARENTHESE_DROITE = 276,
     OR = 277,
     AND = 278,
     XOR = 279,
     NOT = 280,
     SIN = 281,
     COS = 282,
     NEG = 283
   };
#endif
/* Tokens.  */
#define TRUE 258
#define FALSE 259
#define BOOL_T 260
#define ENTIER 261
#define INT_T 262
#define DECIMAL 263
#define FLOAT_T 264
#define IDENTIFIER 265
#define SET 266
#define EOL 267
#define PRINT 268
#define FIN 269
#define PLUS 270
#define MOINS 271
#define FOIS 272
#define DIVISE 273
#define EQUAL 274
#define PARENTHESE_GAUCHE 275
#define PARENTHESE_DROITE 276
#define OR 277
#define AND 278
#define XOR 279
#define NOT 280
#define SIN 281
#define COS 282
#define NEG 283



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2058 of yacc.c  */
#line 131 "3.y"

  int intval;
  float floatval;
  char *idval;
  char *tval;


/* Line 2058 of yacc.c  */
#line 121 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
