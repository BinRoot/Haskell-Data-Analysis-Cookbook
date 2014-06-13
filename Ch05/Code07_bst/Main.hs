import BSTree

main = do
  let tree = single 5
  let nodes = [6,4,8,2,9]
  let bst = foldl insert tree nodes
  print bst
  print $ find bst 1
  print $ find bst 2
