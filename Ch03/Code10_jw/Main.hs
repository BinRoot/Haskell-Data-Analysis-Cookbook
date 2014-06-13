import Data.List (elemIndices)

main = do
  print $ jaro "marisa" "magical"
  print $ jaro "haskell" "hackage"

-- Computes the Jaro-Winkler distance  
jaro :: Eq a => [a] -> [a] -> Double
jaro s1 s2
  | m == 0    = 0.0
  | otherwise = (1/3) * (m/ls1 + m/ls2 + (m-t)/m)
  where ls1 = toDouble $ length s1
        ls2 = toDouble $ length s2
        m' = matching s1 s2 d
        d = fromIntegral $ max (length s1) (length s2) `div` 2 - 1
        m = toDouble m'
        t = toDouble $ (m' - matching s1 s2 0) `div` 2

toDouble :: Integral a => a -> Double        
toDouble n = (fromIntegral n) :: Double

matching :: Eq a => [a] -> [a] -> Int -> Int
matching s1 s2 d = length $ filter 
                   (\(c,i) -> not (null (matches s2 c i d))) 
                   (zip s1 [0..])

matches :: Eq a => [a] -> a -> Int -> Int -> [Int]
matches str c i d = filter (<= d) $ map (dist i) (elemIndices c str)
  where dist a b = abs $ a - b

