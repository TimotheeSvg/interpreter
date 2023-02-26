%{
  #include<stdio.h>
  #include<stdlib.h>
  #include<string.h>
  #include<math.h>

  struct variable {
    char *name; // le nom de la variable
    char *type; // le type de la variable
    union {
      int intval;
      float floatval;
    } value;
  };

  struct variable tabVariables[999]; // tableau de MAX_VARIABLES variables
  int num_variables = 0; // nombre de variables actuellement dans le tableau


char *find_variable(char *name) {
  int i = 0;
  // Tant que le compteur est inferieur au nombre total de variables
  while(i < num_variables) {
    if (strcmp(tabVariables[i].name, name) == 0) {
      // On retourne le type de la variable a l'index i du tableau tabVariables
      return tabVariables[i].type;
    }
    i++;
  }
  // Si aucune variable ne correspond au nom passe en paramètre, on retourne NULL
  return NULL;
}

 void add_variable(char *name, char *type, void *value) {
  // On verifie si une variable existe deja avec le même nom 
  if(find_variable(name) == NULL){
    // Si le type de la variable est "i" ou "b" (entier ou booleen) ou que la valeur est nulle
    if(strcmp(type, "i") == 0 || strcmp(type, "b") == 0 || value == 0){
      if(strcmp(type, "f") == 0){
        tabVariables[num_variables].value.floatval =0.0;
      }else{
        tabVariables[num_variables].value.intval = value;
      }
    }else{
      // Si le type de la variable n'est ni "i", ni "b", ni "f" et que la valeur n'est pas nulle, on affecte la valeur passee en paramètre 
      tabVariables[num_variables].value.floatval = *(float*) value;
    }

    // On affecte le nom et le type passes en paramètre a la variable dans le tableau tabVariables
    tabVariables[num_variables].name = name;
    tabVariables[num_variables].type = type;

    // On incremente le compteur de variables
    num_variables++;
  }
}

  void set_variable(char *name, void *val, char *typeVal) {

  // On recupère le type de la variable a partir de son nom en appelant la fonction find_variable
  char *type = find_variable(name); 

  // Si la variable n'a pas ete trouvee, on affiche une erreur
  if (type == NULL) {
    printf("Erreur: la variable %s n'a pas ete declaree\n", name);
  } 
  else {
    // Si le type de la variable correspond au type de la valeur a affecter
    if (strcmp(type, typeVal) == 0) {

      // On parcourt le tableau tabVariables a la recherche de la variable a modifier
      int i = 0;
      while (i < num_variables) {
        if (strcmp(tabVariables[i].name, name) == 0) {
          // Selon le type de la variable, on affecte la valeur passee en paramètre a la variable
          if (strcmp(type, "b") == 0) {
            tabVariables[i].value.intval = *((int*) val);
          }
          else if (strcmp(type, "i") == 0) {
            tabVariables[i].value.intval = *((int*) val);
          }
          else if (strcmp(type, "f") == 0) {
            tabVariables[i].value.floatval = *((float*) val);
          }

          break;
        }
        i++;
      }
    } 
    else {
      // Si le type de la variable ne correspond pas au type de la valeur a affecter, on affiche une erreur
      printf("Erreur: le type de %s (%s) ne correspond pas au type de la valeur a affecter (%s)\n", name, type, typeVal);
    }
  }
}

void print_variable(char *name) {
  // On recupère le type de la variable a partir de son nom en appelant la fonction find_variable
  char *type = find_variable(name); 

  if (type == NULL) {
    // Si la variable n'a pas ete trouvee, on affiche une erreur
    printf("Erreur: la variable %s n'a pas ete declaree\n", name);
  } 
  else {
    int i = 0;
    while (i < num_variables) {
      if (strcmp(tabVariables[i].name, name) == 0) {
        // La valeur de la variable a ete trouvee, on l'imprime en fonction de son type
        if (strcmp(type, "b") == 0) {
          printf("%s: %d (booleen)\n", name, tabVariables[i].value.intval);
        } 
        else if (strcmp(type, "i") == 0) {
          printf("%s: %d (entier)\n", name, tabVariables[i].value.intval);
        } 
        else {
          printf("%s: %f (flottant)\n", name, tabVariables[i].value.floatval);
        }
        break;
      }
      i++;
    }
  }
}
  

  
%}

%union {
  int intval;
  float floatval;
  char *idval;
  char *tval;
}

%token <intval> TRUE
%token <intval> FALSE
%token <tval> BOOL_T 

%token <intval> ENTIER
%token <tval> INT_T 

%token <floatval> DECIMAL
%token <tval> FLOAT_T

%token <idval> IDENTIFIER

%token  SET EOL PRINT FIN



%token  PLUS  MOINS FOIS  DIVISE EQUAL
%token  PARENTHESE_GAUCHE PARENTHESE_DROITE
%token	OR AND XOR NOT
%token	SIN COS
%left PLUS  MOINS
%left FOIS DIVISE   
%left OR AND
%left XOR NOT

%left NEG 

%type <intval> e
%type <intval> b
%type <floatval> f

%start Input

%% 

Input:
	action EOL
	| FIN {exit(0);}
	
action : 
  declarationAffectation
  |declaration
  |affectation
  | debug



  
declarationAffectation:
	SET BOOL_T IDENTIFIER EQUAL b {
		add_variable($3, $2, $5);
	}

	| SET INT_T IDENTIFIER EQUAL e {
		add_variable($3, $2, $5);
	}
	| SET FLOAT_T IDENTIFIER EQUAL f {
		add_variable($3, $2, &$5);
	}

declaration:
	SET BOOL_T IDENTIFIER {
		add_variable($3, $2, NULL);
		printf("declaration neutre de : %s type  : %s valeur :%d \n", $3, $2, NULL);
	}
	| SET INT_T IDENTIFIER{
		add_variable($3, $2, NULL);
		printf("declaration neutre de : %s type  : %s valeur :%d \n", $3, $2, NULL);
	}
	| SET FLOAT_T IDENTIFIER{
		add_variable($3, $2, NULL);
		printf("declaration neutre de : %s type  : %s valeur :%d \n", $3, $2, NULL);
	}

affectation:


	IDENTIFIER EQUAL b {set_variable($1, &$3, "b"); }
	|IDENTIFIER EQUAL e {set_variable($1, &$3, "i"); }
	|IDENTIFIER EQUAL f {set_variable($1, &$3, "f"); }
	|IDENTIFIER EQUAL IDENTIFIER {
			char *type = find_variable($1);
			set_variable($1, $3,type ); 
			}






debug:
	PRINT IDENTIFIER {
		print_variable($2);
		
	}
	

e:
   e PLUS e  {$$ = $1 + $3;}
  |e MOINS e  {$$= $1 - $3;}
  |e FOIS e  {$$ = $1 * $3;}
  |e DIVISE e  { if($3 != 0){
			$$ = $1 / $3;
		}else{
			yyerror("Division par 0 impossible \n");
		}
	       }
  |SIN PARENTHESE_GAUCHE e PARENTHESE_DROITE {$$ = sin($3);}
  |COS PARENTHESE_GAUCHE e PARENTHESE_DROITE {$$ = cos($3);}
  |MOINS e  %prec NEG {$$ = -$2;}
  |PARENTHESE_GAUCHE e PARENTHESE_DROITE {$$ = $2;}
  |ENTIER {$$ = $1;};
 
f:
   f PLUS f  {$$ = $1 + $3;}
  |f MOINS f  {$$ = $1 - $3;}
  |f FOIS f  {$$ = $1 * $3;}
  |f DIVISE f  {$$ = $1 / $3;}
  |SIN PARENTHESE_GAUCHE f PARENTHESE_DROITE {$$ = sin($3);}
  |COS PARENTHESE_GAUCHE f PARENTHESE_DROITE {$$ = cos($3);}
  |MOINS f %prec NEG {$$ = -$2;}
  |PARENTHESE_GAUCHE f PARENTHESE_DROITE {$$ = $2;}
  |DECIMAL {$$ = $1;};

b:
   b AND b  {$$ = $1 && $3;}
  |b OR b  {$$ = $1 || $3;}
  |b XOR b  {$$ = $1 != $3;}
  |NOT b %prec NEG {$$ = !$2;}
  |PARENTHESE_GAUCHE b PARENTHESE_DROITE {$$ = $2;}
  |FALSE {$$ = 0;};
  |TRUE {$$ = 1;};



%%
int yyerror (char * s) {
	printf("%s \n",s);
	}

int main() {
    printf("############# \n");
    printf("Interpreter made by Timothee Sauvage \n"); 
    printf("Suivre La doc Parfaite pour savoir ecrire ces propres expressions\n");
    printf("#############\n\n");
    while(1)
    yyparse();

    }