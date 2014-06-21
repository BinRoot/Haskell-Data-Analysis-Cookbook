import Statistics.LinearRegression
import qualified Data.Vector.Unboxed as U

-- Computing a linear regression
main = do
  let xs = U.fromList [1.0, 2.0, 3.0, 4.0, 5.0] :: U.Vector Double
  let ys = U.fromList [1.0, 2.0, 1.3, 3.75, 2.25] :: U.Vector Double
  let (b, m) = linearRegression xs ys
  print $ concat ["y = ", show m, " x + ", show b]
