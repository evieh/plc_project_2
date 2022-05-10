module Pir where

data Prog = Prog [FuncDec] [Initializer] Expression Expression
    deriving (Eq, Show)

data Instruction = Statement Statement | Expression Expression | Reference Reference

data Expression
    = Func_Call Var Expression Expression
    | Var_Expr Var
    | Tup_Expr [Expression]
    | Int_Expr Int
    | Null_Expr Null
    | Op_Expr Expression Operator Expression
    deriving (Eq, Show)

data Operator = Add | Sub | Mul
    deriving (Eq, Ord, Show)

data Statement

data Reference

type Var = String

data Null = Null
    deriving (Eq, Show)

data FuncDec = FuncDec Var Var [Instruction]
