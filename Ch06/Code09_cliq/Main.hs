import Data.Algorithm.MaximalCliques

main = do
  print $ getMaximalCliques edges nodes
  
edges 1 5 = True  
edges 1 2 = True
edges 2 3 = True
edges 2 5 = True
edges 4 5 = True
edges 3 4 = True
edges 4 6 = True
edges _ _ = False

nodes = [1..6]