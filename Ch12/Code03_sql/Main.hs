-- sqlite3 test.db "CREATE TABLE test (id INTEGER PRIMARY KEY, str text); \
-- INSERT INTO test (str) VALUES ('test string');"

{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow

data TestField = TestField Int String deriving (Show)

instance FromRow TestField where
  fromRow = TestField <$> field <*> field

getDB :: Connection -> IO [TestField]
getDB conn = query_ conn "SELECT * from test"

insertToDB :: Connection -> String -> IO ()  
insertToDB conn item = 
  execute conn 
  "INSERT INTO test (str) VALUES (?)" 
  (Only item)

-- Storing to SQLite
main :: IO ()
main = withConnection "test.db" dbActions

dbActions :: Connection -> IO ()
dbActions conn = do
  let dataItems = ["A", "B", "C"]
  mapM_ (insertToDB conn) dataItems 
  r <- getDB conn
  mapM_ print r 
