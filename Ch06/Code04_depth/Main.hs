import Data.Graph
import Data.Array ((!))

graph :: (Graph, Vertex -> (Int, Int, [Int]))
graph = graphFromEdges' [ (1, 1, [3, 4] )
                        , (2, 2, [3, 4]) 
                        , (3, 3, [4])
                        , (4, 4, []) ]

-- Traversing a graph depth-first
main = do
  print $ depth graph 0
  
depth g i = depth' g [] i
depth' g@(gShape, gMapping) seen i = 
  key : concat (map goDeeper adjacent)
  where goDeeper v = if v `elem` seen then [] else depth' g (i:seen) v
        adjacent = gShape ! i
        (_, key, _) = gMapping i
