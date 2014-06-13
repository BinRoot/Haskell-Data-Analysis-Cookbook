import qualified Data.MemoCombinators as Memo

main = do
  print $ lev "mercury" "sylvester"

-- Computes the edit distance  
lev :: Eq a => [a] -> [a] -> Int
lev a b = levM (length a) (length b)
  where levM = memoize lev'
        lev' i j
          | min i j == 0 = max i j
          | otherwise    = minimum 
                           [ ( 1 + levM (i-1) j )
                           , ( 1 + levM i (j-1) )
                           , ( ind i j + levM (i-1) (j-1) ) ]
        ind i j
          | a !! (i-1) == b !! (j-1) = 0
          | otherwise                = 1
    
min3 a b c = min (min a b) c

memoize = Memo.memo2 (Memo.integral) (Memo.integral)
