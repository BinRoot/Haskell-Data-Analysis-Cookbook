-- sudo apt-get install libphash0-dev
import Data.PHash
import Data.Maybe (fromJust, isJust)

-- Applying a perceptual hash to images
main = do
  phash1 <- imageHash "image1.jpg"
  putStrLn $ "image1: " ++ show phash1
  
  phash2 <- imageHash "image2.jpg"
  putStrLn $ "image2: " ++ show phash2
  
  phash3 <- imageHash "image3.jpg"
  putStrLn $ "image3: " ++ show phash3

  case (phash1, phash2) of
    (Just h1, Just h2) -> do
      putStr "hammind distance: "
      print $ hammingDistance h1 h2
    _ -> putStrLn "Error, could not read images"

  case (phash1, phash3) of
    (Just h1, Just h3) -> do
      putStr "hammind distance: "
      print $ hammingDistance h1 h3
    _ -> putStrLn "Error, could not read images"
