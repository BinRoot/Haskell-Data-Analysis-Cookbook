import Criterion.Main

splitUp filename = readFile filename >>= return . words

-- Timing using criterion
main = defaultMain 
  [ bgroup "splitUp" 
    [ bench "big" $ nfIO $ splitUp "big.txt" 
    , bench "small" $ nfIO $ splitUp "small.txt" ] ]


{-

warming up
estimating clock resolution...
mean is 1.082787 us (640001 iterations)
found 42320 outliers among 639999 samples (6.6%)
  1860 (0.3%) low severe
  40460 (6.3%) high severe
estimating cost of a clock call...
mean is 33.40185 ns (10 iterations)
found 2 outliers among 10 samples (20.0%)
  1 (10.0%) high mild
  1 (10.0%) high severe

benchmarking splitUp/big
collecting 100 samples, 1 iterations each, in estimated 65.46450 s
mean: 656.1964 ms, lb 655.5417 ms, ub 657.1513 ms, ci 0.950
std dev: 4.018375 ms, lb 3.073741 ms, ub 5.746751 ms, ci 0.950

benchmarking splitUp/small
mean: 15.33773 us, lb 15.16429 us, ub 15.56298 us, ci 0.950
std dev: 1.010893 us, lb 823.5281 ns, ub 1.277931 us, ci 0.950
found 8 outliers among 100 samples (8.0%)
  5 (5.0%) high mild
  3 (3.0%) high severe
variance introduced by outliers: 61.572%
variance is severely inflated by outliers

-}
