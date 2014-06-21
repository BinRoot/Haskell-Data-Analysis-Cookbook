import Data.Graph
import Data.Graph.Automorphism

main = print $ isIsomorphic graph graph'

graph = buildG (0,4) [ (1, 3), (1, 4) 
                     , (1, 2), (2, 3)
                     , (2, 4), (3, 4) ]
        
graph' = buildG (0,4) [ (3, 1), (3, 2) 
                      , (3, 4), (4, 1)
                      , (4, 2), (1, 2) ]

         