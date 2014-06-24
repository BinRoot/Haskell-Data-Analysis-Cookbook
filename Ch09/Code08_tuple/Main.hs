import Control.Parallel.Strategies

-- Accessing tuples in parallel
main = do
  let (a, b) = withStrategy (parTuple2 rseq rseq) (task1, task2)
  print $ seq (a+b) "done 1"
  let (a, bs) = withStrategy (parTuple2 rseq rdeepseq) (task1, tasks)
  print $ seq (a + sum bs) "done 2"
  
task1 = 8^8^8 :: Integer
task2 = 8^8^8 :: Integer
tasks = [10^10..10^10+10000] :: [Integer]
