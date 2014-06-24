import Network.HTTP
import Control.Concurrent

-- Communicating between forked IO actions
main = do
  m <- newEmptyMVar
  forkIO $ process m
  
  putStrLn "sending first website..."
  putMVar m "http://www.haskell.com"
  
  putStrLn "sending second website..."
  putMVar m "http://www.gnu.org"
  
  threadDelay $ 10 * 1000000
  
process m = do 
  v <- takeMVar m
  resp <- get v
  putStrLn $ "response from " ++ show v ++ " is \n" ++ resp
  process m

get :: String -> IO String
get url = do
  resp <- simpleHTTP (getRequest url) 
  body <- getResponseBody resp
  return $ take 10 body
