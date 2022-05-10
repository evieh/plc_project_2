{
module Tup_Y where
import Tokens
import Tup
}

%name parseTup
%tokentype { Token }
%error { parseError }

%token
    endl            { TupEndl $$ }
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
    NUM             { TupInt $$ }
    VAR             { TupLabel $$ }
%%

-- replace this with your productions:

Prog
: FuncDecs endl Expr '=' Expr       { Prog $1 $3 $5 }
| FuncDecs endl Expr '=' Expr endl  { Prog $1 $3 $5 }

Pattern
: '(' VarTup ')'                { Tup_Var $2 }
| VAR                           { PatVar $1 }
| '#'                           { Null_Pat Null }

Patterns
:                              { [ ] }
| PatternList                  { $1 }
PatternList
: Pattern                   { [$1] }
| Pattern PatternList       { $1 : $2 }

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
     | Expr Oper Expr                   { Op_Expr $1 $2 $3 }
     -- | Expr '+' Expr                   { Op_Expr $1 Add $3 }
     -- | Expr '*' Expr                   { Op_Expr $1 Mul $3 }
     -- | Expr '-' Expr                   { Op_Expr $1 Sub $3 }
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
