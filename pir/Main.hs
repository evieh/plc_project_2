import Pir_Y -- Pir_Y.y
import Tokens -- tokens.x
import Pir -- Pir.hs
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  s <- readFile $ head args
  putStrLn $ show $ parsePir $ alexScanTokens s
  -- writeFile "parsed.pir" ""
  -- writeFile "parsed.pir" (show $ parsePir $ alexScanTokens s)
