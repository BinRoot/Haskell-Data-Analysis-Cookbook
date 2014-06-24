import Control.Monad.Par

main = print $ length $ show $ runPar mypar

mypar = do 
  v1 <- new :: Par (IVar Integer)
  v2 <- new :: Par (IVar Integer)
  fork $ put v1 task1
  fork $ put v2 task2
  v1' <- get v1
  v2' <- get v2
  return (v1' + v2')  

task1 = 8^8^8

task2 = 8^8^7
