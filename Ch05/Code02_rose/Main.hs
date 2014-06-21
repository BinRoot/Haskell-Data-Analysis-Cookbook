data Tree a = Node { value    :: a 
                   , children :: [Tree a] }
            deriving Show

-- Creating a rose tree                     
main = do
  let n1 = Node { value = 1, children = [] }
  let n2 = Node { value = 2, children = [] }
  let n3 = Node { value = 3, children = [] }
  let n4 = Node { value = 6, children = [n1, n2, n3] }
  print n4
  
