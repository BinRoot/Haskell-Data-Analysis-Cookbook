import Math.Geometry.Grid (indices, neighbours)
import Math.Geometry.Grid.Hexagonal (hexHexGrid)
import Math.Geometry.Grid.Square (rectSquareGrid)
import Math.Geometry.GridMap ((!))
import Math.Geometry.GridMap.Lazy (lazyGridMap)

-- Using various grids
main = do
  let putStrLn' str = putStrLn ('\n':str)
  putStrLn' "Indices of hex grid:"
  print $ indices hex
  putStrLn' "Neighbors around (1,1) of hex grid:"
  print $ neighbours hex (1,1)
  putStrLn' "Indices of rect grid:"
  print $ indices rect
  putStrLn' "Neighbors around (1,1) of rect grid:"
  print $ neighbours rect (1,1)
  putStrLn' "value of hex at index (1,1)"
  print $ hexM ! (1,1)

hex = hexHexGrid 4

rect = rectSquareGrid 3 5

hexM = lazyGridMap hex [1..]
