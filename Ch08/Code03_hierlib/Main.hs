import Data.Clustering.Hierarchical

data Point = Point [Double] deriving Show

dist :: Point -> Point -> Distance
dist (Point a) (Point b) = sqrt $ sum $ map (^2) $ zipWith (-) a b

-- Using hiearchical clustering from a library
main = do
  let points = map Point [[0,0], [1,0], [0,1], [1,1], [7,5], [9,6], [8,7]]
  let clusters = dendrogram SingleLinkage points dist
  printCluster clusters 2.0

printCluster :: Dendrogram Point -> Double -> IO ()
printCluster clusters cut = do
  let es = map elements $ clusters `cutAt` cut
  mapM_ print es

  
