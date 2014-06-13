import Data.Char (toLower)
import Data.List (group, sort)

main = print $ edits1 "hi"

-- Finds words one edit distance away  
edits1 :: String -> [String]
edits1 word = unique $ deletes ++ transposes ++ replaces ++ inserts
  where splits     = [ (take i word', drop i word') | 
                       i <- [0..length word']]
        deletes    = [ a ++ (tail b) | 
                       (a,b) <- splits, (not.null) b]
        transposes = [ a ++ [b!!1] ++ [head b] ++ (drop 2 b) | 
                       (a,b) <- splits, length b > 1 ]
        replaces   = [ a ++ [c] ++ (drop 1 b) | 
                       (a,b) <- splits, c <- alphabet, (not.null) b ]
        inserts    = [a ++ [c] ++ b | 
                      (a,b) <- splits, c <- alphabet ]
        alphabet   = ['a'..'z']
        word'      = map toLower word
        
unique :: [String] -> [String]
unique = map head.group.sort

{-
edits1 :: [String] -> String
edits1' ls = unique $ concat $ map edits1 ls

editsN :: String -> Int -> [String]
editsN word n = iterate edits1' (edits1 word) !! n
-}

edits1' :: [String] -> [String]
edits1' ls = unique $ concat $ map edits1 ls

editsN :: String -> Int -> [String]        
editsN word n = iterate edits1' (edits1 word) !! n


