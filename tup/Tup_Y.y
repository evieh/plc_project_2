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

PatternList : Pattern PatternList       { $1 : $2 }
            | Pattern                   { [$1] }
            |                           { [] }

FuncDecLine : id PatternList '|' Expr '=' Expr   { FuncDecLine $1 $2 $4 $6 }
            | id PatternList '=' Expr            { FuncDecLine $1 $2 Null $4 }

--FuncDec :

--FuncTest : Expr '=' Expr

Expr : '(' Expr ')'                          { $2 }
     |

VarTupInner : id ',' VarTupInner        { $1 : $3 }
            | id                        { [$1] }
            |                           { [] }

{

parseError :: [Token] -> a
parseError tks = error ("Parse error: " ++ show tks)

}
