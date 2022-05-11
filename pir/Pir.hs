module Pir where

data Prog = Prog [FuncDec] [Statement] Expression Expression
    deriving (Eq, Show)

data Expression
    = Func_Call Var Var Var
    | Int_Expr Int
    | Null_Expr Null
    | NullTest_Expr Expression
    | Op_Expr Expression Operator Expression
    deriving (Eq, Show)

-- data Expression
--     = Func_Call Var Var Var
--     | Var_Expr Var
--     | Tup_Expr [Expression]
--     | Int_Expr Int
--     | Null_Expr Null
--     | NullTest_Expr Expression
--     | Op_Expr Expression Operator Expression
--     deriving (Eq, Show)

data Operator = Add | Sub | Mul
    deriving (Eq, Ord, Show)

data Statement
  = If Expression [Statement] [Statement]
  | Assignment Reference Expression
  | Return Expression
    deriving (Eq, Show)

data Reference = Ref Var | SubRef Var Int
    deriving (Eq, Show)

type Var = String

data Null = Null
    deriving (Eq, Show)

data FuncDec = FuncDec Var Var [Statement]
    deriving (Eq, Show)
