import Text.PhoneticCode.Soundex (soundexNARA, soundexSimple)
import Text.PhoneticCode.Phonix (phonix)

ws = ["haskell", "hackle", "haggle", "hassle"]

-- Computes the phonetic codes
main :: IO ()
main = do
  print $ map soundexNARA ws
  print $ map soundexSimple ws
  print $ map phonix ws
  
