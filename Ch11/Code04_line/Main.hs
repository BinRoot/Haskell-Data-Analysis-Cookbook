import Graphics.EasyPlot

-- Displaying a line graph using gnuplot
main = do
  let values = [4,5,16,15,14,13,13,17]
  plot X11 $ 
    Data2D [ Title "Line Graph"
           , Style Linespoints
           , Color Blue] 
    [] (zip [1..] values)
