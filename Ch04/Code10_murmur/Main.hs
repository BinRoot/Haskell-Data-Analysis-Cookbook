import Data.Digest.Murmur32

data Point = Point Int Int
instance (Hashable32 Point) where 
  hash32Add (Point x y) h = x `hash32Add` (y `hash32Add` h)

-- Performing a Murmur hash
main = do
  let p1 = Point 0 0
  let p2 = Point 2 3
  putStrLn $ "hash of string: " ++ (show.hash32) "SO FAST WOW."
  putStrLn $ "hash of a data-type: " ++ (show.hash32) p1
  putStrLn $ "hash of another data-type: " ++ (show.hash32) p2
