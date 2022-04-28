module Tup where

data Pattern = Var String | Null | Tup_Expr [Expression]

data Expression
    = Func_Expr String [ Expression ]
    | Value Pattern
    | Int_Expr Int
    | Operator_Expr Operator Expression Expression


data Operator = Add | Sub | Mul
    deriving (Eq, Ord, Show)


