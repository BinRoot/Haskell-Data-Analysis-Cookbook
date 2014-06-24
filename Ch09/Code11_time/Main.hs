import System.CPUTime (getCPUTime)
import Control.Monad (replicateM_)
import Control.Parallel.Strategies (NFData, rdeepseq)
import Control.Exception (evaluate)

-- Timing performance
time :: (Num t, NFData t) => t -> IO ()
time y = do
  let trials = 10^6
  start <- getCPUTime
  replicateM_ trials $ do
    x <- evaluate $ 1 + y
    rdeepseq x `seq` return ()
  end   <- getCPUTime
  let diff = (fromIntegral (end - start)) / (10^12)
  putStrLn $ "avg seconds: " ++  
    (show (diff / fromIntegral trials))
  return ()


main = do
    putStrLn "Starting pure..."
    time (3+7 :: Int)
    putStrLn "...Finished pure"
