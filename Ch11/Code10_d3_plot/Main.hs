import D3JS
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

myPlot points = do
  let dim = (300, 300)
  elem <- box (T.pack "#myChart") dim
  scatter (Data2D points) elem
  addFrame (300, 300) (250, 250) elem   

-- Rendering a scatter plot in D3
main = do
  let points = [(1,2), (5,10), (139,138), (140,150)]
  let js = reify $ myPlot points
  TIO.writeFile "generated.js" js
  
