{
module Pir_Y where
import Tokens
}

%name parsePir
%tokentype { Token }
%error { parseError }

%token
    null            { PirNull }
    ';'             { PirSemi }
    '.'             { PirIndex }
    '{'             { PirLBrack }
    '}'             { PirRBrack }
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
: FuncDecs '!' Statements '!' Expr '=' Expr       { Prog $1 $3 $5 $7 }

Statement
: if Expr '{' Statements '}' else '{' Statements '}'     { If $2 $4 $8 }
| Reference '=' Expr ';'                                { Assignment $1 $3 }
| return Expr ';'                                       { Return $2 }

StatementLines
: Statement                     { [$1] }
| Statement StatementLines      { $1 : $2 }

Statements 
:                               { [ ] }
| StatementLines                { $1 }                 

Reference
: VAR                           { Ref $1 }
| VAR '.' NUM                   { SubRef $1 $3 }

VarTup
:                                { [ ] }
| VarTupInner                    { $1 }

VarTupInner
: VAR                       { [$1] }
| VAR ',' VarTupInner       { $1 : $3 }

FuncDecs
: FuncDec                      { [$1]    }
| FuncDec FuncDecs         { $1 : $2 }

FuncDec: VAR '(' VAR ',' VAR ')' '{' Statements '}'  { $1 $3 $5 $8 }

-- FuncTest : Expr '=' Expr        { FuncTest $1 $2 $4}

Expr : VAR '(' VAR ',' VAR ')'          { Func_Call $1 $3 $5 }
     | NUM                              { Int_Expr $1      }
     | null                             { Null_Expr Null   } -- ? maybe add token?
     | nullTest '(' VAR ')'             { NullTest_Expr $4 }
     | Expr Oper Expr                   { Op_Expr $1 $2 $3 }
    --  | '(' Expr ')'                     { $2               }
    --  | '(' ExprTup ')'                  { Tup_Expr $2      }

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
