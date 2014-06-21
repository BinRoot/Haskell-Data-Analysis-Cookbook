import Math.Statistics

-- Computing the covariance matrix
main = do print $ covMatrix matrixArray
  where matrixArray = [ [1,1,0,0]
                      , [0,1,0,1]
                      , [1,1,0,1] ]

