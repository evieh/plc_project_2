module Tup where

data Pattern = Var | ( [ Var ] ) | "#"

data Expression = ( [Expression, Expression] ) | ( Expression ) | Int | 

type Tup = Pattern | Expression
    --deriving show

-- change this to things like pattern and expressions