{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.ByteString.Lazy as S
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import qualified Data.Text.Lazy.Encoding as E
import qualified Data.ByteString as BS
import Data.Text.Lazy (toStrict)

import Data.Text.Template

myData = [ [ ("name", "Databender"), ("title", "Dr.") ],
           [ ("name", "Paragon"), ("title", "Master") ],
           [ ("name", "Marisa"), ("title", "Madam") ] ]

myTemplate = template "Hello $title $name!"
myData' = context [ ("name", "Joe"), ("title", "Mr") ]    

context :: [(T.Text, T.Text)] -> Context
context assocs x = maybe err id . lookup x $ assocs
  where err = error $ "Could not find key: " ++ T.unpack x

-- Exporting with text templates
main :: IO ()
main = do
  let res = map (\d -> toStrict( render myTemplate (context d))) myData
  TIO.writeFile "messages.txt" $ T.unlines res
    

