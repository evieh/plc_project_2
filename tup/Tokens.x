{
module Tokens where
}

%wrapper "basic"

tokens :-

  [\n]+                            { \s -> TupEndl s}
  -- [\n]                            ;
  $white+                         ;
  [a-z][a-z0-9]*                  { \s -> TupLabel s }
  \-?[0-9]+                        { \s -> TupInt (read s) }
  \(                              { \s -> TupLParen }
  \)                              { \s -> TupRParen }
  \,                              { \s -> TupComma }
  \#                              { \s -> TupNull }
  \!                              { \s -> TupExclam }
  \|                              { \s -> TupPipe }
  \=                              { \s -> TupEquals }
  \*                              { \s -> TupMul }
  \+                              { \s -> TupAdd }
  \-                              { \s -> TupSub }
{

-- The token type:
data Token
  = TupLabel String
  | TupInt Int
  | TupLParen
  | TupRParen
  | TupComma
  | TupNull
  | TupExclam
  | TupPipe
  | TupEquals
  | TupEndl String
  | TupMul
  | TupAdd
  | TupSub
           deriving (Eq,Show)

}
