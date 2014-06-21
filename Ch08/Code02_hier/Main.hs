import Data.Map (Map, (!), delete)
import qualified Data.Map as Map
import Data.Ord (comparing)
import Data.List (sort, tails, transpose, minimumBy)

type Point = [Double]

center :: [Point] -> Point
center points = map average (transpose points)
  where average xs = sum xs / fromIntegral (length xs)

merge :: Map Point [Point] -> Map Point [Point]
merge m = Map.insert (center [a,b]) ((m ! a) ++ (m ! b)) newM
  where (a,b) = nearest (Map.keys m)
        newM = Map.delete b (Map.delete a m)
        equal a b = dist a b < 0.00001
        dist a b = sqrt $ sum $ map (^2) $ zipWith (-) a b
        nearest points = minimumBy (comparing (uncurry dist)) 
          [(a, b) | (a : rest) <- tails points, b <- rest]

run :: Int -> Map Point [Point] -> Map Point [Point]
run k m = if length (Map.keys m) == k then m else run k (merge m)

initilize :: [Point] -> Map Point [Point]
initilize points = foldl (\m p -> Map.insert p [p] m) Map.empty points

-- Running heiarchical clustering
main = do
  let points = [[0,0], [1,0], [0,1], [1,1], [7,5], [9,6], [8,7]]
  let centroids = Map.keys $ run 2 (initilize points)
  print centroids
