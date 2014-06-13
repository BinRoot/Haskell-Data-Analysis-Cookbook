{-# LANGUAGE OverloadedStrings #-}

import Data.ByteString.Search.KarpRabin (indicesOfAny)
import qualified Data.ByteString as BS

-- Finds substrings
main = do
  let needles = [ "preparing to go away"
                , "is some letter of recommendation"]
  haystack <- BS.readFile "big.txt"
  print $ indicesOfAny needles haystack
