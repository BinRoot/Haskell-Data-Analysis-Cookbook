import Data.List (maximum)
import Data.Tree

main = do
  print $ height someTree

height :: Tree a -> Int
height (Node val []) = 1
height (Node val xs) = 1 + maximum (map height xs)

someTree :: Tree Integer
someTree = root
  where root = Node 0 [n1, n4]
        n1   = Node 1 [n2, n3]
        n2   = Node 2 []
        n3   = Node 3 []
        n4   = Node 4 []
