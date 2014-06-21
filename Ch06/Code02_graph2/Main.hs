import Data.Graph

-- Defining a graph edges
myGraph :: Graph
myGraph = fst $ graphFromEdges' [ ("Node 1", 1, [3, 4]) 
                                , ("Node 2", 2, [3, 4])
                                , ("Node 3", 3, [4])
                                , ("Node 4" ,4, []) ]

main = do
  putStrLn $ "The edges are " ++ (show.edges) myGraph
  putStrLn $ "The vertices are " ++ (show.vertices) myGraph
