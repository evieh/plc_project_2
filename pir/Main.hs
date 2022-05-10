import Pir_Y -- tup.y
import Tokens -- tokens.x
import Pir -- Tup.hs
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  s <- readFile $ head args
  putStrLn $ show $ parsePir $ alexScanTokens s
  -- writeFile "parsed.pir" ""
  -- writeFile "parsed.tup" (show $ parsePir $ alexScanTokens s)