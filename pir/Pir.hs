module Pir where

data Prog = Prog [FuncDec] [Statement] Expression Expression
    deriving (Eq, Show)

data Instruction = Statement Statement | Expression Expression | Reference Reference
    deriving (Eq, Show)

data Expression
    = Func_Call Var Expression Expression
    | Var_Expr Var
    | Tup_Expr [Expression]
    | Int_Expr Int
    | Null_Expr Null
    | NullTest_Expr Expression
    | Op_Expr Expression Operator Expression
    deriving (Eq, Show)

data Operator = Add | Sub | Mul
    deriving (Eq, Ord, Show)

data Statement
  = If Expression [Instruction] [Instruction]
  | Assignment Reference Expression
  | Return Expression
    deriving (Eq, Show)

data Reference = Ref Var | SubRef Var Int
    deriving (Eq, Show)

type Var = String

data Null = Null
    deriving (Eq, Show)

data FuncDec = FuncDec Var Var [Instruction]
    deriving (Eq, Show)
