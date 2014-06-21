import Data.Graph

-- Defining a graphical network
myGraph :: Graph
myGraph = buildG bounds edges
  where bounds = (1,4)
        edges = [ (1,3), (1,4)
                , (2,3), (2,4)
                , (3,4) ]

main = do
  putStrLn $ "The edges are " ++ (show.edges) myGraph
  putStrLn $ "The vertices are " ++ (show.vertices) myGraph
