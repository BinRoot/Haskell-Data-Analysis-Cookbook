import Text.CSV
import Graphics.EasyPlot

tupes :: [[String]] -> [(Double, Double)]
tupes records = [(read x, read y) | [x, y] <- records]

-- Visualizing points
main = do 
  result <- parseCSVFromFile "input.csv"
  case result of
    Left err -> putStrLn "Error reading CSV file"
    Right csv -> do 
      plot X11 $ Data2D [Title "Plot"] [] (tupes csv)
      return ()

