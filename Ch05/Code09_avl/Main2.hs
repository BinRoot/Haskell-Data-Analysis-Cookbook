import qualified Data.Set as S

main = do
  let s = S.fromList [4,2,1,5,3,6]
  let min = S.findMin s
  let max = S.findMax s
  print min
  print max
