-- Computes the cosine similarity
main :: IO ()
main = do
  let d1 = [3.5, 2, 0, 4.5, 5, 1.5, 2.5, 2]
  let d2 = [3, 0, 0, 5, 4, 2.5, 3, 0]
  let similarity = dot d1 d2 / (eLen d1 * eLen d2)
  print similarity
  
dot a b = sum $ zipWith (*) a b  
eLen a = sqrt $ dot a a
