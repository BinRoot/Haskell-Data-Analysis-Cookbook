import Data.List (tails, nub, sort)

-- Finding all pairs in a list
main = do
  print $ pairs [1,2,3,4]

pairs xs = [(x, y) | (x:ys) <- tails (nub xs), y <- ys]
