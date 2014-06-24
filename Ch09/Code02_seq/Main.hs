import Control.Parallel.Strategies (runEval, rpar, rseq)

-- Using the seq function
main = do
  print $ runEval $ do
    a <- rpar task1
    b <- rpar task2
    rseq a
    rseq b
    return (a, b)

task1 = 8^8^9 :: Integer

task2 = 8^8^8 :: Integer
