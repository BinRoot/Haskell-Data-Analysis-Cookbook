data Tree a = Node { value :: a 
                   , left  :: (Tree a) 
                   , right :: (Tree a)} 
            | Null 
            deriving (Eq, Show)

main = do
  print $ valid someTree
  
someTree :: Tree Int
someTree = root  
  where root = Node 0 n1 n4
        n1   = Node 1 n2 n3
        n2   = Node 2 Null Null
        n3   = Node 3 Null Null
        n4   = Node 4 Null Null

valid :: Ord t => Tree t -> Bool
valid (Node v l r) = leftValid && rightValid
  where leftValid  = if notNull l then valid l && value l <= v else True
        rightValid = if notNull r then valid r && v <= value r else True
        notNull t = t/=Null
