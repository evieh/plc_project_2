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
    id              { TokenID $$ }

    --'->'  { TokenArrow}
--%right '->'

%%

-- replace this with your productions:
Prog : FuncDec '\n' '!' '\n' Prog       { $1 : $5 }
     | FuncTest                         { [$1] }

Pattern : '(' VarTupInner ')'           { $2 }

PatternList : Pattern PatternList       { $1 : $2 }
            | Pattern                   { [$1] }
            |                           { [  ] }

FuncDecLine : id PatternList | Expr '=' Expr   { $1 }

--FuncDec :

--FuncTest : Expr '=' Expr

VarTupInner : id ',' VarTupInner        { $1 : $3 }
| id                                    { [$1] }

{

parseError :: [Token] -> a
parseError tks = error ("Parse error: " ++ show tks)

}
