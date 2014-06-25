import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import D3JS

myChart nums numBars = do
  let dim = (300, 300)
  elem <- box (T.pack "#myChart") dim
  bars numBars 300 (Data1D nums) elem
  addFrame (300, 300) (250, 250) elem

-- Rendering a bar graph in D3  
main = do
  let nums = [10, 40, 100, 50, 55, 156, 80, 74, 40, 10]
  let numBars = 5
  let js = reify $ myChart nums numBars
  TIO.writeFile "generated.js" js
