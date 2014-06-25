import Graphics.Google.Chart

-- Plotting a line chart
main = do
  rawInput <- readFile "input.txt"
  let nums = map (read :: String -> Int) (lines rawInput)
  putStrLn $ chartURL $
    setSize 500 200 $
    setTitle "Example of Plotting a Chart in Haskell" $
    setData (encodeDataSimple [nums]) $
    setLegend ["Stock Price"] $
    newLineChart
