import Graphics.Google.Chart

-- Plotting bar graphs
main = do
  rawInput1 <- readFile "input1.txt"
  rawInput2 <- readFile "input2.txt"
  let nums1 = map (read :: String -> Int) (lines rawInput1)
  let nums2 = map (read :: String -> Int) (lines rawInput2)
  putStrLn $ chartURL $
    setSize 500 400 $
    setTitle "Example of Plotting a Bar Chart in Haskell" $
    setDataColors ["00ff00", "ff0000"] $
    setLegend ["A", "B"] $
    setData (encodeDataSimple [nums1, nums2]) $
    newBarChart Horizontal Grouped
