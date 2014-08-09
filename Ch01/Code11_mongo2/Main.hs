{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}
import Database.MongoDB
import Text.URI
import Data.Maybe
import qualified Data.Text as T
import Data.List.Split

mongoURI = "mongodb://user:pass@ds035438.mongolab.com:35438/mydb"
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
  pipe <- connect (readHostPort hostport)
  e <- access pipe master getDb run
  close pipe
  print e
  
run = do
  auth (T.pack getUser) (T.pack getPass)
  getData

getData = rest =<< find (select [] "people") {sort=[]}
