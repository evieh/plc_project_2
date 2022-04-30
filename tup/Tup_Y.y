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
    '\n'            { TupEndl }
    NUM             { TupInt $$ }
    VAR             { TupLabel $$ }
%%

-- replace this with your productions:
Prog : FuncDecs '\n' '!' '\n' FuncTest       { Prog $1 $5 }

Pattern : '(' VarTupInner ')'           { Tup_Var $2 }
        | VAR                           { PatVar $1 }
        | '#'                           { Null_Pat Null }

PatternList : Pattern PatternList       { $1 : $2 }
            | Pattern                   { [$1] }
            |                           { [] }


VarTupInner : VAR ',' VarTupInner        { $1 : $3 }
            | VAR                        { [$1] }
            |                            { [] }

FuncDecLine : VAR PatternList '|' Expr '=' Expr { FuncDecLine $1 $2 $4 $6   }
            | VAR PatternList '=' Expr             { FuncDecLine $1 $2 Null $4 }

FuncDec : FuncDecLine  '\n' FuncDec     { $1 : $3 }
        | FuncDecLine                   { [$1]    }
        |                               { [ ]     }

FuncDecs : FuncDec '\n' '!' '\n' FuncDecs { $1 : $5 }
         | FuncDec                        { [$1]    }
         |                                { [ ]     }
         | Expr '=' Expr                  {         }

FuncTest : VAR Expr '=' Expr                { FuncTest $1 $2 $4}

Expr : VAR '(' ExprTupInner ')'         { Func_Call $1 $3  }
     | VAR                              { Var_Expr $1           }
     | '(' Expr ')'                     { $2               }
     | '(' ExprTupInner ')'             { Tup_Expr $2      }
     | '#'                              { Null_Expr Null   }
     | NUM                              { Int_Expr $1      }
     | Expr Oper Expr                   { Op_Expr $1 $2 $3 }

Oper : '+'                              { Add }
     | '*'                              { Mul }
     | '-'                              { Sub }

ExprTupInner : VAR ',' ExprTupInner     { $1 : $3 }
             | VAR                      { [$1] }
             |                          { [ ] }

{

parseError :: [Token] -> a
parseError tks = error ("Parse error: " ++ show tks)

}
