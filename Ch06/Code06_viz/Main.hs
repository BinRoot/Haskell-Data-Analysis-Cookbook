import Data.GraphViz

-- Visualizing a graphical network
main = addExtension (runGraphviz graph) Png "graph"

graph :: DotGraph Int
graph = graphElemsToDot graphParams nodes edges

graphParams :: GraphvizParams Int String Bool () String
graphParams = defaultParams

nodes :: [(Int, String)]
nodes = map (\x -> (x, "")) [1..4]

edges :: [(Int, Int, Bool)]
edges = [ (1, 3, True)
              , (1, 4, True) 
              , (2, 3, True)
              , (2, 4, True)
              , (3, 4, True)]
