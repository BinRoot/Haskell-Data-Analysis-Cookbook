import Text.JSON.Yocto
import qualified Data.Map as M

data Point = Point Rational Rational

pointObject (Point x y) = 
  Object $ M.fromList [ ("x", Number x)
                      , ("y", Number y)]

-- Exporting to JSON
main = do
  let points = [ Point 1 1
               , Point 3 5
               , Point (-3) 2]
  let pointsArray = Array $ map pointObject points
  writeFile "points.json" $ encode pointsArray
