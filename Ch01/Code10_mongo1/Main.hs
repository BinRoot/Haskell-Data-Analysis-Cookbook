{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}
import Database.MongoDB

-- Reads from MongoDB
main :: IO ()
main = do
  let db = "test"
  pipe <- connect (host "127.0.0.1")
  e <- access pipe master db run
  close pipe
  print e
  
run = do
  getData

getData = rest =<< find (select [] "people") {sort=[]}
