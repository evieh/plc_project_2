{
module Tokens where
}

%wrapper "basic"

tokens :-

  -- [\n]+                            { \s -> TupEndl s}
  $white+                         ;
  \(                              { \s -> PirLParen }
  \)                              { \s -> PirRParen }
  \{                              { \s -> PirLBrack }
  \}                              { \s -> PirRBrack }
  \,                              { \s -> PirComma }
  \#                              { \s -> PirNull }
  \!                              { \s -> PirExclam }
  \.                              { \s -> PirSub }
  \;                              { \s -> PirSemi }
  \|                              { \s -> PirPipe }
  \=                              { \s -> PirEquals }
  \*                              { \s -> PirMul }
  \+                              { \s -> PirAdd }
  \-                              { \s -> PirSub }
  if                              { \s -> PirIf }
  null\?                          { \s -> PirNullTest }
  else                            { \s -> PirElse }
  return                          { \s -> PirReturn }
  [a-z][a-z0-9]*                  { \s -> PirLabel s }
  \-?[0-9]+                       { \s -> PirInt (read s) }
{

-- The token type:
data Token = TokenArrow | TokenLParen | TokenRParen
           deriving (Eq,Show)

}
