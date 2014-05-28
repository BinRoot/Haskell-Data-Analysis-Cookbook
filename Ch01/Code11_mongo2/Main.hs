{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}
import Database.MongoDB
import Text.URI
import Data.Maybe
import qualified Data.Text as T
import Data.List.Split

mongoURI = "mongodb://user:pass@ds123.mongolab.com:53788/test"
uri = fromJust $ parseURI mongoURI
getUser = head $ splitOn ":" $ fromJust $ uriUserInfo uri
getPass = last $ splitOn ":" $ fromJust $ uriUserInfo uri
getHost = fromJust $ uriRegName uri
getPort = case uriPort uri of 
  Just port -> show port 
  Nothing -> (last.words.show) defaultPort
getDb = T.pack $ tail $ uriPath uri

-- Reads from remote MongoDB server
main :: IO ()
main = do
  let hostport = getHost ++ ":" ++ getPort
  pipe <- runIOE $ connect (readHostPort hostport)
  e <- access pipe master getDb run
  close pipe
  print e
  
run = do
  auth (T.pack getUser) (T.pack getPass)
  getData

getData = rest =<< find (select [] "people") {sort=[]}
