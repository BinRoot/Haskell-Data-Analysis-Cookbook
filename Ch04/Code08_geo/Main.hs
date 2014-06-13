import Data.Geohash

-- Hashing latitude/longitude pairs
main = do
  let geohash1 = encode 10 (37.775, -122.419)
  putStrLn $ "geohash1 is " ++ (show geohash1)
  case geohash1 of
    Just g -> putStrLn $ "decoding geohash1: " ++ (show.decode) g
    Nothing -> putStrLn "error encoding"
    
  let geohash2 = encode 10 (37.175, -125.419)
  putStrLn $ "geohash2 is " ++ (show geohash2)
  case geohash2 of
    Just g -> putStrLn $ "decoding geohash2: " ++ (show.decode) g
    Nothing -> putStrLn "error encoding"
