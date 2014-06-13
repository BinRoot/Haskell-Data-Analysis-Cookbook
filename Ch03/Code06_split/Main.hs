import Data.List.Split (splitOn)

-- Splits a string by some delimeter
main = do 
  input <- readFile "input.txt"
  let ls = lines input
  print $ ls
  -- ["first line","second line","words are split by space","comma,separated,values","or any delimiter you want"]
  let ws = words $ ls !! 2
  print ws
  -- ["words","are","split","by","space"]
  let cs = splitOn "," $ ls !! 3
  print cs
  -- ["comma","separated","values"]
  let ds = splitOn "an" $ ls !! 4
  print ds
  -- ["or any d","limit","r you want"]
