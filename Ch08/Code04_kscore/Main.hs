import Data.Map (Map, (!), keys)
import qualified Data.Map as Map
import Data.List (sort, and, minimumBy)
import Data.Ord (comparing)
import Data.Maybe (fromJust)
import System.Random
import Statistics.Sample (variance)
import Data.Vector.Unboxed (fromList)

type Point = [Double]

-- Euclidian distance function
dist :: Point -> Point -> Double
dist a b = sqrt $ sum $ map (^2) $ zipWith (-) a b

-- Assign points to closest centroids
assign :: [Point] -> [Point] -> Map Point [Point]
assign centroids points = Map.fromListWith (++) 
                          [(assignPoint p, [p]) | p <- points]
  where assignPoint p = minimumBy (comparing (dist p)) centroids

-- Relocate centroids to the middle of its group
relocate :: Map Point [Point] -> Map Point [Point]
relocate centroidsMap = Map.foldWithKey insertCenter Map.empty centroidsMap
  where insertCenter _ ps m = Map.insert (center ps) ps m
        center [] = [0,0]
        center points = map (/len) $ foldl1 add points
          where len = fromIntegral $ length points
                add = zipWith (+)

        
-- Assign points and relocate centroids until centroids converge
kmeans :: [Point] -> [Point] -> [Point]
kmeans centroids points = 
  if converged then centroids else kmeans (Map.keys newCentroidsMap) points
  where converged = all (< 0.00001) $ 
          zipWith dist (sort centroids) (Map.keys newCentroidsMap)
        converged' = and $ zipWith equal 
                    (sort centroids) (sort (Map.keys newCentroidsMap))
        newCentroidsMap = relocate (assign centroids points)
        equal a b = dist a b < 0.00001

-- Run the kmeans algorithm on test points
main = do
  let points = [[0,0], [1,0], [0,1], [20,0], [21,0], [20,1], [40,5], [40,6], [40,8]]
  let centroids = [kmeans (take k points) points | k <- [1..length points]]
  print centroids
  let avgVars = map (avgVar points) centroids
  print avgVars

-- Compute the average variance
avgVar points centroids = avg [variance . fromList $
  map (dist c) ps | (c, ps) <- Map.assocs m]
  where m = assign centroids points
        avg xs = (sum xs) / (fromIntegral (length xs))
