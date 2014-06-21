import Data.Trees.KdTree
import Data.IP (IPv4, fromIPv4)
import Text.CSV
import qualified Data.Map as M
import Data.Maybe (fromJust)

ipToNum :: String -> Double
ipToNum str = fromIntegral $ sum $ 
  zipWith (\a b -> a * 256^b) ns [0..]
  where ns = reverse $ fromIPv4 (read str :: IPv4)

parse :: [Record] -> [(Point3d, String)]
parse [] = []
parse xs = map pair (cleanList xs)
  where pair [ip, t, c] = (Point3d (ipToNum ip) (read t) 0.0, c)
        cleanList = filter (\x -> length x == 3)

maxFreq :: [String] -> String
maxFreq xs = fst $ foldl myCompare ("", 0) freqs
  where freqs = M.toList $ M.fromListWith (+) [(c, 1) | c <- xs]
        myCompare (oldS, oldV) (s,v) = if v > oldV
                                     then (s, v)
                                     else (oldS, oldV)

test :: KdTree Point3d -> Int -> [(Point3d, String)] -> Point3d -> String
test kdtree k pairList p = maxFreq $ map classify neighbors
  where neighbors = kNearestNeighbors kdtree k p
        classify x = fromJust (lookup x pairList)

-- Running a k-nearest neighbor algorithm
main = do
  rawCSV <- parseCSVFromFile "input.csv"
  either handleError doWork rawCSV

handleError = error "Invalid CSV file"

doWork rawCSV = do
  let ps = parse rawCSV
  let kdtree = fromList (map fst ps)
  let examples = [ ["71.190.100.100", "2000", "?"]
                 , ["216.239.33.1", "1", "?"] ]
  let examplePts = map fst $ parse examples
  print $ map (test kdtree 2 ps) examplePts

