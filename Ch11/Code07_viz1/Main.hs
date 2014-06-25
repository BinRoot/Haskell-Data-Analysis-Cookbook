-- install graphviz
-- cabal install graphviz
-- runhaskell Main.hs > graph.dot
-- dot -Tpng graph.dot > graph.png

import Data.Text.Lazy (Text, empty, unpack)
import Data.Graph.Inductive (Gr, mkGraph)
import Data.GraphViz (GraphvizParams, nonClusteredParams, graphToDot)
import Data.GraphViz.Printing (toDot, renderDot)

myGraph :: Gr Text Text
myGraph = mkGraph [ (1, empty)
                  , (2, empty)
                  , (3, empty) ]
          [ (1, 2, empty) 
          , (1, 3, empty) ]

myParams :: GraphvizParams n Text Text () Text
myParams = nonClusteredParams

-- Visualizing a graphical network
main :: IO ()
main = putStr $ unpack $ renderDot $ toDot $ graphToDot myParams myGraph
