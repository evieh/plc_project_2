{
    module Tup_Y where
    import Tokens
    import Tup
}

%name parseTup
%tokentype { Token }
%error { parseError }

%token
    '('  { TokenLParen }
    ')'  { TokenRParen }
    '->'  { TokenArrow}

%right '->'

%%

-- replace this with your productions:
Tup : { Unit }
-- : '(' ')'       { Unit }
-- | '(' Tp ')'    { $2 }
-- | Tp '->' Tp    { Arrow $1 $3 }

{

parseError :: [Token] -> a
parseError tks = error ("Parse error: " ++ show tks)

}
