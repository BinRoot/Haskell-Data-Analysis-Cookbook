-- install gnuplot
-- cabal install csv
import Graphics.EasyPlot
import Text.CSV

convertRawCSV :: [[String]] -> [(Double, Double, Double)]
convertRawCSV csv = [(read x, read y, read z) | [x, y, z] <- csv]

-- Interacting with points in 3D
main = do
  csv1Raw <- parseCSVFromFile "input1.csv"
  csv2Raw <- parseCSVFromFile "input2.csv"
  let csv1 = case csv1Raw of
        Left err -> []
        Right csv -> convertRawCSV csv
  let csv2 = case csv2Raw of
        Left err -> []
        Right csv -> convertRawCSV csv

  plot' [Interactive] X11 $ 
    [ Data3D [Color Red] [] csv1
    , Data3D [Color Blue] [] csv2]
    
