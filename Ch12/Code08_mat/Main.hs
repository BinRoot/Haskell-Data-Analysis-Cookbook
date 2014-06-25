import Data.Array.Repa.IO.Matrix
import Data.Array.Repa

x :: Array U DIM2 Int 
x = fromListUnboxed (Z :. (4::Int) :. (3::Int)) 
  [ 1, 2, 9, 10
  , 4, 3, 8, 11
  , 5, 6, 7, 12 ]

-- Exporting a matrix
main = writeMatrixToTextFile "output.dat" x

