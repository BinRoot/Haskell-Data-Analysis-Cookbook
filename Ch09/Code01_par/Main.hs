import Control.Parallel.Strategies (runEval, rpar)

-- parallelizing a procedure
main = do
  print $ runEval $ do
    a <- rpar task1
    b <- rpar task2
    return (a, b)

task1 = 8^8^9 :: Integer

task2 = 8^8^8 :: Integer
