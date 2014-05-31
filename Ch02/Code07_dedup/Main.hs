import Text.CSV (parseCSV, Record)
import Data.Map (fromListWith)
import qualified Data.Set as S

data Artist = Artist { name :: String
                     , song :: S.Set String
                     , genre :: S.Set String
                     } deriving Show

-- Combines duplicated CSV data into a set
main :: IO ()
main = do
  let fileName = "input.csv"
  input <- readFile fileName
  let csv = parseCSV fileName input
  either handleError doWork csv

handleError = print

doWork :: [Record] -> IO ()
doWork csv = print $ fromListWith combine $ map parseToTuple csv

combine :: Artist -> Artist -> Artist
combine artist1 artist2 = 
  Artist { name = name artist1
         , song = S.union (song artist1) (song artist2)
         , genre = S.union (genre artist1) (genre artist2) }
                          
parseToTuple :: [String] -> (String, Artist)
parseToTuple record = (name item, item) 
  where item = parseItem record

parseItem :: Record -> Artist
parseItem record = 
  Artist { name = nameStr
         , song = if null songStr 
                  then S.empty 
                  else S.singleton songStr
         , genre = if null genreStr 
                   then S.empty 
                   else S.singleton genreStr
         }
  where nameStr  = record !! 0
        songStr = record !! 1
        genreStr  = record !! 2

                            
