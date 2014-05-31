import Text.CSV (parseCSV, Record)
import Data.Map (fromListWith)
import Control.Applicative ((<|>))

data Item = Item { name :: String
                 , color :: String
                 , cost :: Maybe Float
                 } deriving Show

-- Combines CSV fields from duplicated data
main :: IO ()
main = do
  let fileName = "input.csv"
  input <- readFile fileName
  let csv = parseCSV fileName input
  either handleError doWork csv

handleError = print

doWork :: [Record] -> IO ()
doWork csv = print $ fromListWith combine $ map parseToTuple csv

combine :: Item -> Item -> Item
combine item1 item2 = Item { name = name item1
                           , color = color item1 <|> color item2
                           , cost = cost item1 <|> cost item2 }

parseToTuple :: Record -> (String, Item)
parseToTuple record = (name item, item) 
  where item = parseItem record

parseItem :: Record -> Item
parseItem record = 
  Item { name = record !! 0
       , color = record !! 1
       , cost = case reads (record !! 2)::[(Float,String)] of
          [(c, "")] -> Just c
          _ -> Nothing 
       }

