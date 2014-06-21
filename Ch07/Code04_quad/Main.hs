import Data.Array (listArray, elems)
import Matrix.LU (solve)

-- Computing the quadratic regression 
fit d vals = elems $ solve mat vec  where
   mat = listArray ((1,1), (d,d)) $ matrixArray
   vec = listArray (1,d) $ take d vals
   matrixArray = concat [polys x d | x <- [0..fromIntegral (d-1)]]
   polys x d = map (x**) [0..fromIntegral (d-1)]

main = print $ fit 3 [1,6,17,34,57,86,121,162,209,262,321]

equation coeffs = zip coeffs (reverse [1..length coeffs])
