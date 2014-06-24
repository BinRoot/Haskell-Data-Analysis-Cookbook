import Control.Parallel.Strategies

-- Mapping in parallel
main = do
  print $ ((parMap rdeepseq (^10) [10^10..10^10+10000]) :: [Int])
