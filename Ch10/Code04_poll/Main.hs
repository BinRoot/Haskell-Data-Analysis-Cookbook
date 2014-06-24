import Network.HTTP
import Control.Concurrent (threadDelay)
import qualified Data.Text as T

url = "http://www.reddit.com/r/pics/new.json"

latest :: IO String
latest = simpleHTTP (getRequest url) >>= getResponseBody

-- Polling a web server
doWork str = length $ T.breakOnAll 
             (T.pack "imgur.com/") (T.pack str)

poll :: IO a
poll = do
  body <- latest
  print $ doWork body
  threadDelay (10 * 10^6)
  poll
  
main :: IO a
main = do
  putStrLn $ "Polling " ++ url ++ " ..."
  poll
  


  
