import Tup_Y -- tup.y
import Tokens -- tokens.x
import Tup -- Tup.hs
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  s <- readFile $ head args
  putStrLn $ show $ parseTup $ alexScanTokens s