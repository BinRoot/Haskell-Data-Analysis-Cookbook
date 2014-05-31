{-# LANGUAGE OverloadedStrings #-}

import Data.Attoparsec.Text
import Data.Char (isSpace, isAlphaNum)

data Email = Email 
  { user :: String
  , host :: String
  } deriving Show

email :: Parser Email
email = do
  skipSpace
  user <- many' $ satisfy isAlphaNum
  at <- char '@'
  hostName <- many' $ satisfy isAlphaNum
  period <- char '.'
  domain <- many' (satisfy isAlphaNum)
  return $ Email user (hostName ++ "." ++ domain)
  
-- Lexes and parses an email address
main :: IO ()
main = print $ parseOnly email "nishant@shukla.io"
