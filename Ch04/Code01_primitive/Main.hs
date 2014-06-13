import Data.Hashable

-- Hashing with salt
main = do
  print $ hash "foo" -- default salt is 0xdc36d1615b7400a4
  print $ hashWithSalt 1 "foo"
  print $ hashWithSalt 2 "foo"
  print $ hash [ (1 :: Int, "hello", True)
               , (0 :: Int, "goodbye", False) ]
  

