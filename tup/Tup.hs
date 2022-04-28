module Tup where

data Pattern = Var String | Null | Tup_Expr [Expression]

data Expression =
--    = Var_Expr String
--    | Tup_Expr [Expression] 
    Func_Expr String [ Expression ] 
    | Value Pattern
--    | Null_Expr
    | Int_Expr Int 
    | Operator_Expr Operator Expression Expression

-- data Value = Var String | Null | Tup_Expr [Expression]

data Operator = Add | Sub | Mul
    deriving (Eq, Ord, Show)


-- type FuncDec = String [Pattern] Expression
    --deriving show

-- change this to things like pattern and expressions