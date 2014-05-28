import Text.XML.HXT.Core
import Data.List.Split (chunksOf)

-- Parses HTML for table rows
main :: IO ()
main = do
  input <- readFile "input.html"
  texts <- runX $ readString [withParseHTML yes, withWarnings no] input 
    //> hasName "td"
    //> getText
  let rows = chunksOf 3 texts
  print $ findBiggest rows

-- finds the classroom with largest capacity
findBiggest :: [[String]] -> [String]
findBiggest [] = []
findBiggest items = foldl1 (\a x -> if capacity x > capacity a then x else a) items

capacity [a,b,c] = toInt c
capacity _ = -1

toInt :: String -> Int
toInt = read
