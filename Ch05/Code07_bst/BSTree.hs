module BSTree (insert, find, single) where

data Tree a = Node { value :: a 
                   , left  :: (Tree a) 
                   , right :: (Tree a)} 
            | Null 
            deriving (Eq, Show)

single :: a -> Tree a
single n = Node n Null Null

insert :: Ord a => Tree a -> a -> Tree a
insert (Node v l r) v'
  | v' < v    = Node v (insert l v') r
  | v' > v    = Node v l (insert r v')
  | otherwise = Node v l r
insert _ v' = Node v' Null Null

find :: Ord a => Tree a -> a -> Bool
find (Node v l r) v'
  | v' < v = find l v'
  | v' > v = find r v'
  | otherwise = True
find Null v' = False
