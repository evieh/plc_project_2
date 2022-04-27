{
    module Pir where
    import Tokens
}

%name parsePir
%tokentype { Token }
%error { parseError }

%token
    '('  { TokenLParen }
    ')'  { TokenRParen }
    '->'  { TokenArrow}

%right '->'

%%

-- replace this with your productions:
-- Tp
-- : '(' ')'       { Unit }
-- | '(' Tp ')'    { $2 }
-- | Tp '->' Tp    { Arrow $1 $3 }

{

parseError :: [Token] -> a
parseError tks = error ("Parse error: " ++ show tks)

}