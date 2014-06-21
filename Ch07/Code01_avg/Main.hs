-- Computing the moving average
main = do
  rawInput <- readFile "input.txt"
  let input = clean rawInput
  print input
  putStrLn $  "mean is " ++ (show.mean) input
  putStrLn $  "moving average is " ++ (show.avg) input
  
clean :: String -> [Double]
clean raw = map (\s -> read s :: Double) (lines raw)

avg :: [Double] -> Double
avg (x:xs) = a*x + (1-a)*(avg xs)
  where a = 0.95
avg [] = 0

mean :: Fractional a => [a] -> a
mean xs = (sum xs) / (fromIntegral (length xs))

-- [4.0,3.0,2.0,5.0,3.0,4.0,1.0,3.0,12.0,3.0]
-- mean is 4.0
-- moving average is 3.9478627675211913
