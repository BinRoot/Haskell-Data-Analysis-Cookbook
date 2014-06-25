import Graphics.Google.Chart

-- Plotting a pie chart
main = do
  rawInput <- readFile "input.txt"
  let nums = map (read :: String -> Int) (lines rawInput)
  putStrLn $ chartURL $
    setSize 500 400 $
    setTitle "Example of Plotting a Pie Chart in Haskell" $
    setData (encodeDataSimple [nums]) $
    setLabels (lines rawInput) $
    newPieChart Pie2D
