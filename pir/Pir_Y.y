{
    module Pir where
    import Tokens
}

%name parsePir
%tokentype { Token }
%error { parseError }

%token
    endl            { PirEndl $$ }
    '#'             { PirNull }
    ';'             { PirSemi }
    '.'             { PirSub }
    '{'             { PirLBrack }
    '}'             { PirRBrack }
    '?'             { PirQuery }
    '='             { PirEquals }
    '!'             { PirExclam }
    ','             { PirComma }
    '('             { PirLParen }
    ')'             { PirRParen }
    '|'             { PirPipe }
    '+'             { PirAdd }
    '*'             { PirMul }
    '-'             { PirSub }
    if              { PirIf }
    nullTest        { PirNullTest }
    else            { PirElse }
    return          { PirReturn }
    NUM             { PirInt $$ }
    VAR             { PirLabel $$ }


%%

-- replace this with your productions:
Prog
: FuncDecs '!' Inits '!' Expr '=' Expr       { Prog $1 $3 $5 $7 }

Statement
:

VarTup
:                                { [ ] }
| VarTupInner                    { $1 }

VarTupInner
: VAR                       { [$1] }
| VAR ',' VarTupInner       { $1 : $3 }

FuncDecLine
: VAR Patterns '|' Expr '=' Expr endl { FuncDecLine $1 $2 $4 $6   }
| VAR Patterns '=' Expr endl          { FuncDecLine $1 $2 (Null_Expr Null) $4 }

FuncDec
: FuncDecLines '!'  { $1 }

FuncDecLines
: FuncDecLine               { [$1] }
| FuncDecLine  FuncDecLines { $1 : $2 }

FuncDecs
: FuncDec                      { [$1]    }
| FuncDec FuncDecs         { $1 : $2 }

-- FuncTest : Expr '=' Expr        { FuncTest $1 $2 $4}

Expr : VAR Expr Expr                    { Func_Call $1 $2 $3 }
     | VAR                              { Var_Expr $1      }
     | '#'                              { Null_Expr Null   }
     | NUM                              { Int_Expr $1      }
     | SubExpr Oper SubExpr                   { Op_Expr $1 $2 $3 }
     | '(' Expr ')'                     { $2               }
     | '(' ExprTup ')'                  { Tup_Expr $2      }

Oper : '+'                              { Add }
     | '*'                              { Mul }
     | '-'                              { Sub }

ExprTup :                                { [ ] }
        | ExprTupInner                   { $1 }
ExprTupInner : Expr ',' Expr             { $1 : [$3] }
             | Expr ',' ExprTupInner     { $1 : $3 }

{

parseError :: [Token] -> a
parseError tks = error ("Parse error: " ++ show tks)

}
