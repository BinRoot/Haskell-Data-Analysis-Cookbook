module Main where

-- Reads a file as input
main :: IO ()
main = do
  input <- readFile "input.txt"
  print $ countWords input

-- Counts the number of words per line  
countWords input = map (length.words) (lines input)
