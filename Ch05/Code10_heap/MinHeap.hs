module MinHeap (empty, insert, deleteMin, viewMin, weights) where

import Control.Lens (element, set)
import Data.Maybe (isJust, fromJust)

  
data Heap v = Heap { items :: [Node v] } deriving Show
                       
data Node v = Node { value :: v, weight :: Int } deriving Show

empty = Heap []

insert v w (Heap xs) = percolateUp position items'
  where items'   = xs ++ [Node v w]
        position = length items' - 1

deleteMin (Heap xs) 
  | null xs   = Heap xs
  | otherwise = percolateDown 1 items'
  where items' = set (element 1) (last xs) (init xs)

viewMin heap@(Heap (_:y:_)) = Just (y, deleteMin heap)
viewMin _                   = Nothing

percolateDown i items
  | isJust left && isJust right = percolateDown i' (swap i i' items)
  | isJust left = percolateDown l (swap i l items)
  | otherwise = Heap items
  where left = if l >= length items then Nothing 
             else Just $ items !! l
        right = if r >= length items then Nothing 
                else Just $ items !! r
        i' = if (weight (fromJust left)) < (weight (fromJust right))
             then l else r
        l = 2*i
        r = 2*i + 1

percolateUp i items
  | i == 1 = Heap items
  | w < w' = percolateUp c (swap i c items)
  | otherwise = Heap items
  where w = weight $ items !! i
        w' = weight $ items !! c
        c = i `div` 2

swap i j xs = set (element j) vi (set (element i) vj xs)
  where vi = xs !! i
        vj = xs !! j
        
weights heap = map weight ((tail.items) heap)
