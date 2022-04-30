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
    '|'             { TupGuard }
    '\n'            { TupEndl }
    NUM             { TupInt $$ }
    VAR             { TupLabel $$ }

    --'->'  { TokenArrow}
--%right '->'

%%

-- replace this with your productions:
Prog : FuncDecs '\n' '!' '\n' FuncTest       { Prog $1 $5 }

Pattern : '(' VarTupInner ')'           { $2 }
        | VAR                           { Var $1 }
        | '#'                           { Null }

PatternList : Pattern PatternList       { $1 : $2 }
            | Pattern                   { [$1] }
            |                           { [] }

--FuncTest : Expr '=' Expr

Expr : '(' Expr ')'                          { $2 }
     |

VarTupInner : VAR ',' VarTupInner        { $1 : $3 }
            | VAR                        { [$1] }
            |                            { [] }

FuncDecLine : VAR PatternList (pipe) Expr '=' Expr { FuncDecLine $1 $2 $4 $6   }
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
     | VAR                              { Var $1           }
     | '(' Expr ')'                     { $2               }
     | '(' ExprTupInner ')'             { $2               }
     | '#'                              { Null             }
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
