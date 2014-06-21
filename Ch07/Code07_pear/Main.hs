import Math.Statistics (pearson)
import Text.CSV
import Data.List (tails, nub)

-- Computing the pearson coefficient to detect similarities
main = do
  let fileName = "ratings.csv"
  input <- readFile fileName
  let csv = parseCSV fileName input
  print $ calcSimilarities csv

calcSimilarities :: Either e [Record] -> (Double, ([String],[String]))
calcSimilarities (Left err) = error "error parsing"
calcSimilarities (Right csv) = maximum $ zip 
  [ pearson (convertList a) (convertList b) 
  | (a,b) <- csvPairs] $ csvPairs
  where csvPairs = pairs $ filter (/= [""]) csv
convertList :: [String] -> [Double]
convertList = map read

pairs xs = [(x, y) | (x:ys) <- tails (nub xs), y <- ys]
