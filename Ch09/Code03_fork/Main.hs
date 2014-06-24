import Control.Concurrent (forkIO, threadDelay)

-- Forking IO actions
main = do
  putStr "Enter number of seconds to sleep: "
  time <- fmap (read :: String -> Int) getLine
  forkIO $ sleep time
  main
  
sleep :: Int -> IO ()
sleep t = do
  let micro = t * 1000000
  threadDelay micro
  putStrLn $ "[Just woke up after " ++ show t ++ " seconds]"
