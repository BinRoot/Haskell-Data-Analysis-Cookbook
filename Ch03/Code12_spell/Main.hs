import Data.Char (isAlpha, isSpace, toLower)
import Data.List (sort, group, maximumBy)
import Data.Map (fromListWith, Map, member, (!))
import Data.Ord (comparing)

-- Corrects word spellings in a sentence
autofix :: Map String Int -> String -> String
autofix m sentence = unwords $ map (correct m) (words sentence)
  
getWords :: String -> [String]
getWords str = words $ filter (\x -> isAlpha x || isSpace x) lower
  where lower = map toLower str
        
train :: [String] -> Map String Int
train = fromListWith (+) . (`zip` repeat 1)

edits1 :: String -> [String]
edits1 word = unique $ deletes ++ transposes ++ replaces ++ inserts
  where splits     = [ (take i word', drop i word') 
                     | i <- [0..length word'] ]
        deletes    = [ a ++ (tail b) 
                     | (a,b) <- splits, (not.null) b ]
        transposes = [ a ++ [b !! 1] ++ [head b] ++ (drop 2 b) 
                     | (a,b) <- splits, length b > 1 ]
        replaces   = [ a ++ [c] ++ (drop 1 b) 
                     | (a,b) <- splits
                     , c <- alphabet
                     , (not.null) b ]
        inserts    = [ a ++ [c] ++ b 
                     | (a,b) <- splits
                     , c <- alphabet ]
        alphabet   = ['a'..'z']
        word'      = map toLower word

knownEdits2 :: String -> Map String a -> [String]        
knownEdits2 word m = unique $ [ e2 
                              | e1 <- edits1 word
                              , e2 <- edits1 e1
                              , e2 `member` m]

unique :: [String] -> [String]
unique = map head.group.sort

known :: [String] -> Map String a -> [String]
known ws m = filter (`member` m) ws

correct :: Map String Int -> String -> String                   
correct m word = maximumBy (comparing (m!)) candidates
  where candidates = head $ filter (not.null) 
                     [ known [word] m 
                     , known (edits1 word) m
                     , knownEdits2 word m
                     , [word] ]

main :: IO ()
main = do
  rawText <- readFile "big.txt"
  let m = train $ getWords rawText
  let sentence = "such codez many hsakell very spel so korrect"
  print $ autofix m sentence
