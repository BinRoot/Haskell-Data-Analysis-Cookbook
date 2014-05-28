{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow

data TestField = TestField Int String deriving (Show)

instance FromRow TestField where
  fromRow = TestField <$> field <*> field

-- Reads from SQLite
main :: IO ()
main = do
  conn <- open "test.db"
  r <- query_ conn "SELECT * from test" :: IO [TestField]
  mapM_ print r
  close conn
