import Text.CSV (parseCSV)

-- Computes the Manhattan distance
main :: IO ()
main = do
  let fileName = "input.csv"
  input <- readFile fileName
  let csv = parseCSV fileName input
  let points = either (\e -> []) (map toPoint . myFilter) csv
  let test1 = [2,1]
  let test2 = [-10,-10]
  if (not.null) points then do
    print $ minimum $ map (manhattanDist test1) points
    print $ minimum $ map (manhattanDist test2) points
  else putStrLn "Error: no points to compare"
  
toPoint record = map (read :: String -> Float) record

manhattanDist p1 p2 = sum $ zipWith (\x y -> abs (x - y)) p1 p2

myFilter = filter (\x -> length x == 2)

