import Data.Monoid (mempty, mappend)
import qualified Data.Foldable as F 
import Data.Foldable (Foldable, foldMap)

data Tree a = Node { value    :: a 
                   , children :: [Tree a] }
            | Null
            deriving Show

-- Folding through a tree
main :: IO ()
main = print $ add someTree

add :: Tree Integer -> Integer
add = F.foldr (+) 0

instance Foldable Tree where
    foldMap f Null = mempty
    foldMap f (Node val xs) = foldr mappend (f val) 
                              [foldMap f x | x <- xs]

someTree :: Tree Integer
someTree = root
  where root = Node { value = 0, children = [n1, n4] }
        n1   = Node { value = 1, children = [n2, n3] }
        n2   = Node { value = 2, children = [] }
        n3   = Node { value = 3, children = [] }
        n4   = Node { value = 4, children = [] }
