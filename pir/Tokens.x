{
module Tokens where
}

%wrapper "basic"

tokens :-

  -- [\n]+                            { \s -> TupEndl s}
  $white+                         ;
  [a-z][a-z0-9]*                  { \s -> PirLabel s }
  \-?[0-9]+                       { \s -> PirInt (read s) }
  \(                              { \s -> PirLParen }
  \)                              { \s -> PirRParen }
  \{                              { \s -> PirLBrack }
  \}                              { \s -> PirRBrack }
  \,                              { \s -> PirComma }
  \#                              { \s -> PirNull }
  \!                              { \s -> PirExclam }
  \?                              { \s -> PirQuery }
  \.                              { \s -> PirSub }
  \;                              { \s -> PirSemi }
  \|                              { \s -> PirPipe }
  \=                              { \s -> PirEquals }
  \*                              { \s -> PirMul }
  \+                              { \s -> PirAdd }
  \-                              { \s -> PirSub }
{

-- The token type:
data Token
 = PirLabel String
 | PirInt Int
 | PirLParen
 | PirRParen
 | PirLBrack
 | PirRBrack
 | PirComma
 | PirNull
 | PirExclam
 | PirQuery
 | PirSub
 | PirSemi
 | PirPipe
 | PirEquals
 | PirMul
 | PirAdd
 | PirSub
          deriving (Eq,Show)

}
