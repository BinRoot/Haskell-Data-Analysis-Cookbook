import Data.List (sort, group, sortBy, groupBy, isPrefixOf, lookup)
import Control.Parallel
import Control.Parallel.Strategies
import Data.Char (isAlpha, isSpace, toLower)
import Data.Map (Map, insertWith, empty, toList)
import qualified Data.Map as M
import System.Directory

-- Implementing MapReduce
mapReduce :: Strategy b -> (a -> b) -> Strategy b -> ([b] -> b) -> [a] -> b
mapReduce mStrategy m rStrategy r input = 
  mOutput `pseq` rOutput
  where mOutput = parMap mStrategy m input
        rOutput = r mOutput `using` rStrategy

mapper :: String -> [(String,Int)] 
mapper str = freqCount $ getWords str

freqCount :: [String] -> [(String, Int)]
freqCount xs = map (\x -> (head x, length x)) . group . sort $ xs

getWords :: String -> [String]
getWords str = words $ filter (\x -> isAlpha x || isSpace x) lower
  where lower = map toLower str

reducer :: [[(String,Int)]] -> [(String,Int)]
reducer ls = toList $ 
             foldl (\m (k, v) -> insertWith (+) k v m) 
                   (empty :: Map String Int) 
                   (concat ls)

main = do       
  files <- getCurrentDirectory >>= getDirectoryContents
  let myFiles = filter ("words" `isPrefixOf`) files
  rawFileData <- mapM readFile myFiles
  let freqMap = mapReduce (rpar `dot` rdeepseq) mapper rseq reducer rawFileData
  putStrLn $ "Found "  ++ (show.length) freqMap ++ " words!"
  queryInput freqMap

queryInput freqMap = do
  putStrLn "Enter a sentence: "
  sentence <- getLine
  let freqs = map (`lookup` freqMap) (words sentence)
  print $ zip (words sentence) freqs
  queryInput freqMap

{-

time ./Main +RTS -N
[("no",Just 2328),("one",Just 3215),("who",Just 2994),("is",Just 9731),("young",Just 624),("is",Just 9731),("ever",Just 254),("going",Just 369),("to",Just 28614),("be",Just 6148),("old",Just 1138)]

real	0m2.696s
user	0m8.619s
sys	0m1.309s

-}
