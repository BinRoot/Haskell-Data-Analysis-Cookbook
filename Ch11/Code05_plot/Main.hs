import Graphics.EasyPlot
import Text.CSV

convertRawCSV :: [[String]] -> [(Double, Double)]
convertRawCSV csv = [(read x, read y) | [x, y] <- csv]

-- Displaying a scatter plot of 2D points
main = do
  csv1Raw <- parseCSVFromFile "input1.csv"
  csv2Raw <- parseCSVFromFile "input2.csv"
  let csv1 = case csv1Raw of 
        Left err -> []
        Right csv -> convertRawCSV csv
  let csv2 = case csv2Raw of 
        Left err -> []
        Right csv -> convertRawCSV csv
  plot X11 $ [ Data2D [Color Red] [] csv1
             , Data2D [Color Blue] [] csv2 ]
