{
module Tup_Y where
import Tokens
import Tup
}

%name parseTup
%tokentype { Token }
%error { parseError }

%token
    '#'             { TupNull }
    '='             { TupEquals }
    '!'             { TupExclam }
    ','             { TupComma }
    '('             { TupLParen }
    ')'             { TupRParen }
    '|'             { TupPipe }
    '+'             { TupAdd }
    '*'             { TupMul }
    '-'             { TupSub }
    -- '\n'            { TupEndl }
    NUM             { TupInt $$ }
    VAR             { TupLabel $$ }
%%

-- replace this with your productions:
Prog : AllFuncDecs '!' FuncTest       { Prog $1 $3 }

Pattern : '(' VarTup ')'                { Tup_Var $2 }
        | VAR                           { PatVar $1 }
        | '#'                           { Null_Pat Null }

Patterns :                              { [] }
         | PatternList                  { $1 }
PatternList : Pattern                   { [$1] }
            | Pattern PatternList       { $1 : $2 }

VarTup :                                { [] }
       | VarTupInner                    { $1 }

VarTupInner : VAR                       { [$1] }
            | VAR ',' VarTupInner       { $1 : $3 }

FuncDecLine : VAR Patterns '|' Expr '=' Expr { FuncDecLine $1 $2 $4 $6   }
            | VAR Patterns '=' Expr          { FuncDecLine $1 $2 (Null_Expr Null) $4 }

FuncDec : FuncDecLines                  { $1 }
FuncDecLines : FuncDecLine              { [$1] }
             | FuncDecLine FuncDecLines { $1 : $2 }

AllFuncDecs : FuncDecs                  { $1 }
FuncDecs : FuncDec                      { [$1]    }
         | FuncDec '!' FuncDecs         { $1 : $3 }

FuncTest : VAR Exprs '=' Expr        { FuncTest $1 $2 $4}

Exprs :                                 { [ ] }
      | ExprList                        { $1 }
ExprList : Expr                         { [$1] }
         | Expr ExprList                { $1 : $2 }

Expr : VAR '(' ExprTup ')'              { Func_Call $1 $3  }
     | VAR                              { Var_Expr $1      }
     | '(' Expr ')'                     { $2               }
     | '(' ExprTup ')'                  { Tup_Expr $2      }
     | '#'                              { Null_Expr Null   }
     | NUM                              { Int_Expr $1      }
     | Expr '+' Expr                   { Op_Expr $1 Add $3 }
     | Expr '*' Expr                   { Op_Expr $1 Mul $3 }
     | Expr '-' Expr                   { Op_Expr $1 Sub $3 }

-- Oper : '+'                              { Add }
--      | '*'                              { Mul }
--      | '-'                              { Sub }

ExprTup :                                { [ ] }
        | ExprTupInner                   { $1 }
ExprTupInner : Expr                      { [$1] }
             | Expr ',' ExprTupInner     { $1 : $3 }

{

parseError :: [Token] -> a
parseError tks = error ("Parse error: " ++ show tks)

}
