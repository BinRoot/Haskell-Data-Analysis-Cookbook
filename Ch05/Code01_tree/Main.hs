data Tree a = Node { value :: a 
                   , left  :: (Tree a) 
                   , right :: (Tree a) }
            | Leaf 
            deriving Show

-- Creating a binary tree
main = do
  let n1 = Node { value = 1, left = Leaf, right = Leaf }
  let n2 = Node { value = 2, left = Leaf, right = Leaf }
  let n3 = Node { value = 3, left = n1  , right = n2 }
  print n3
