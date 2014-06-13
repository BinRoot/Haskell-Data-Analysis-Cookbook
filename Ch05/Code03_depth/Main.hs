import Data.Tree (rootLabel, subForest, Tree(..))
import Data.List (tails)

main = do
  print $ depthFirst someTree
  print $ add someTree
  
depthFirst :: Tree a -> [a]
depthFirst (Node r forest) = r : concat [depthFirst t | t <- forest]

add :: Tree Int -> Int
add (Node r forest) = r + sum [add t | t <- forest] 

someTree :: Tree Int
someTree = r
  where r = Node { rootLabel = 0, subForest = [n1, n4] }
        n1   = Node { rootLabel = 1, subForest = [n2, n3] }
        n2   = Node { rootLabel = 2, subForest = [] }
        n3   = Node { rootLabel = 3, subForest = [] }
        n4   = Node { rootLabel = 4, subForest = [] }
