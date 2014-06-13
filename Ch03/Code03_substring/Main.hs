import Data.ByteString (breakSubstring)
import qualified Data.ByteString.Char8 as C

main = do
  print $ substringFound "scraf" "swedish scraf mafia"
  print $ substringFound "flute" "swedish scraf mafia"

-- Finds a substring from a query
substringFound :: String -> String -> Bool  
substringFound query str = (not . C.null . snd) $ 
                           breakSubstring (C.pack query) (C.pack str)
                           
