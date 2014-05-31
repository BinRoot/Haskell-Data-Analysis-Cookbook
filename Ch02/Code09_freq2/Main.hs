import Data.MultiSet (fromList, toOccurList)

data Color = Red | Green | Blue deriving (Show, Ord, Eq)

-- Generates a frequency map using Data.MultiSet
main :: IO ()
main = do
  let items = [Red, Green, Green, Blue, Red, Green, Green]
  let freq = toOccurList . fromList $ items
  print freq
