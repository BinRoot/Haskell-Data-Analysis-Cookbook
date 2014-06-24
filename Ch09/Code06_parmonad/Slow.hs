import Control.Monad.Par

-- Parallelizing pure functions using Par
main = print $ length $ show $ task1 + task2

task1 = 8^8^8
task2 = 8^8^8
