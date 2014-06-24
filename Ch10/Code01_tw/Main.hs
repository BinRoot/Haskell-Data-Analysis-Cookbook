{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Conduit as C
import qualified Data.Conduit.List as CL
import qualified Data.Text.IO as T
import qualified Data.Text as T

import Control.Monad.IO.Class (liftIO)
import Network.HTTP (getResponseBody, getRequest, simpleHTTP, urlEncode)
import Text.JSON.Yocto
import Web.Twitter.Conduit (stream, statusesFilterByTrack)
import Common
import Control.Lens ((^!), act)
import Data.Map ((!))
import Data.List (isInfixOf, or)
import Web.Twitter.Types (userScreenName, statusUser, statusText, StreamingAPI(..))

-- Streaming Twitter for real-time sentiment analysis
main :: IO ()
main = do
  let query = "x-men"
  T.putStrLn $ T.concat [ "Streaming Tweets that match \""
                        , query, "\"..."]
  analyze query

analyze :: T.Text -> IO ()
analyze query = runTwitterFromEnv' $ do
  src <- stream $ statusesFilterByTrack query
  src C.$$+- CL.mapM_ (^! act (liftIO . process))

process :: StreamingAPI -> IO ()
process (SStatus s) = do
  let theUser = userScreenName $ statusUser s
  let theTweet = statusText s
  T.putStrLn $ T.concat [theUser, ": ", theTweet]
  val <- sentiment $ T.unpack theTweet
  let record = (T.unpack theUser) ++ "," ++ (show.fromRational) val ++ "\n"
  appendFile "output.csv" record
  print val
process s = return ()

clean :: String -> String
clean str = unwords $ filter 
            (\w -> not (or 
                   [ isInfixOf "@" w
                   , isInfixOf "#" w
                   , isInfixOf "http://" w ]))
            (words str)

sentiment :: String -> IO Rational
sentiment str = do 
  let baseURL = "http://www.sentiment140.com/api/classify?text="
  resp <- simpleHTTP $ getRequest $ baseURL ++ (urlEncode.clean) str
  body <- getResponseBody resp
  let p = polarity (decode body) / 4.0
  return p
  
polarity :: Value -> Rational
polarity (Object m) = polarity' $ m ! "results"
  where polarity' (Object m) = fromNumber $ m ! "polarity"
        fromNumber (Number n) = n
polarity _ = -1



