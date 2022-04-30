module Tup where

data Pattern = PatVar Var | Null_Pat Null | Tup_Var [Var]
    deriving (Eq, Show)

data Expression
    = Func_Call Var [Expression]
    | Var_Expr Var
    | Tup_Expr [Expression]
    | Int_Expr Int
    | Null_Expr Null
    | Op_Expr Expression Operator Expression
    deriving (Eq, Show)

type Var = String
    -- deriving (Eq, Show)

data Null = Null
    deriving (Eq, Show)

data Operator = Add | Sub | Mul
    deriving (Eq, Ord, Show)

data FuncDecLine = FuncDecLine Var [Pattern] Expression Expression

type FuncDec = [FuncDecLine]

data Prog = Prog [FuncDec] FuncTest

data FuncTest = FuncTest Var [Expression] Expression



