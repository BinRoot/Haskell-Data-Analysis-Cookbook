import Data.List (group, sort)

data Color = Red | Green | Blue deriving (Show, Ord, Eq)

-- Generates a frequency map from a list of items
main :: IO ()
main = do
  let items = [Red, Green, Green, Blue, Red, Green, Green]
  let freq = map (\x -> (head x, length x)) . group . sort $ items
  print freq
