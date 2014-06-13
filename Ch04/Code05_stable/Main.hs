import System.Mem.StableName

data Point = Point [Int]

-- Using a stable name
main = do
  let p1 = Point [1..]
  let p2 = Point [2,4]
  sn1 <- makeStableName p1
  sn2 <- makeStableName p2
  print $ hashStableName sn1
  print $ hashStableName sn2
  
