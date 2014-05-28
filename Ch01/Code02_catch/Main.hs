import Control.Exception (catch, SomeException)
import System.Environment (getArgs)
import System.Directory (doesFileExist)

-- Counts the number of words per line in a file
-- Does not crash if file is missing.
main :: IO ()
main = do
  args <- getArgs
  let fileName = case args of
        (a:_) -> a
        _ -> "input.txt"
        
  exists <- doesFileExist fileName
  input2 <- if exists then readFile fileName else return ""
  
  input <- catch (readFile fileName)
           $ \err -> print (err::SomeException) >> return ""
  print $ countWords input
  
countWords input = map (length.words) (lines input)
