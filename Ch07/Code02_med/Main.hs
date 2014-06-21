import Data.Heap
import Data.Maybe (fromJust)

-- Computing the moving median
main = do
  rawInput <- readFile "input.txt"
  let input = clean rawInput
  print $ input
  print $ median input (empty :: MaxHeap Int) (empty :: MinHeap Int)
  
clean :: String -> [Int]
clean raw = map (\s -> read s :: Int) (lines raw)

median (x:xs) maxheap minheap = case viewHead maxheap of
  Just theMax -> if x < theMax
            then median xs (insert x maxheap) minheap
            else median xs maxheap (insert x minheap)
  Nothing -> median xs (insert x maxheap) minheap

median [] maxheap minheap
  | size maxheap + 1 < size minheap = 
    median [] (insert minelem maxheap) $ 
              (snd.fromJust.view) minheap
  | size minheap + 1 < size maxheap = 
      median [] ((snd.fromJust.view) maxheap) $ 
                insert maxelem minheap
  | size maxheap == size minheap = 
      (fromIntegral maxelem + fromIntegral minelem)/2.0
  | size maxheap > size minheap = fromIntegral maxelem
  | otherwise = fromIntegral minelem
  where maxelem = fromJust (viewHead maxheap)
        minelem = fromJust (viewHead minheap)


