{-# LANGUAGE OverloadedStrings #-}

import Data.ByteString.Search (indices)
import qualified Data.ByteString as BS
import Control.DeepSeq

main = do
  corpus <- BS.readFile "big.txt"
  print $ map (\x -> (not.null) (indices x corpus)) shortNeedles 


shortNeedles = [ "abc", "fwi", "lqa", "pwf", "ooo"
               , "mos", "fez", "cwd", "qfo", "mic"
               , "zoe", "qdk", "bbc", "wwi", "qad"
               , "fwf", "sos", "zez", "dwd", "ofo"
               , "cic", "zde", "kdq", "bna", "uin"]

longNeedles = ["immobilisation", "Your excellency!", "were times when militiamen"
              ,"haskell b curry", "rode silently on his small gray horse"
              , "In regard to philanthropy", "computers are cool", "degree we may imagine"
              , "definitely not", "Only by reducing this element"
              , "imnobilisation", "Ydur excellency!", "were times xhen militiamen"
              ,"With your permission", "rode silentxly on his small gray horse"
              , "exclaimed Natasha.", "During the third night the countess kept", "degfree we may imagine"
              , "definiteldy not", "Only by reducingthis element" ] 




