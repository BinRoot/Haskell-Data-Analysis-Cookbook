import MinHeap

main = do
  let heap = foldr (\x -> insert x x) empty [11, 5, 3, 4, 8]
  print $ weights heap
  print $ weights $ iterate deleteMin heap !! 1
  print $ weights $ iterate deleteMin heap !! 2
  print $ weights $ iterate deleteMin heap !! 3
  print $ weights $ iterate deleteMin heap !! 4