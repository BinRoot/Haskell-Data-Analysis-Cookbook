import Data.Heap (MinHeap, MaxHeap, empty, insert, view)

main = do
  let myList = [11, 5, 3, 4, 8]
  let minHeap = minheapFromList myList
  let maxHeap = maxheapFromList myList
  print $ view minHeap
  print $ view maxHeap

m = empty :: MinHeap Int

minheapFromList :: [Int] -> MinHeap Int
minheapFromList ls = foldr insert empty ls

maxheapFromList :: [Int] -> MaxHeap Int
maxheapFromList ls = foldr insert empty ls

-- Just (3,fromList [(4,()),(11,()),(5,()),(8,())])
-- Just (11,fromList [(8,()),(3,()),(5,()),(4,())])
