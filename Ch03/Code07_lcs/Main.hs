import qualified Data.MemoCombinators as Memo

memoize :: (String -> String -> r) -> String -> String -> r
memoize = Memo.memo2 (Memo.list Memo.char) (Memo.list Memo.char)

-- Finds the longest common subsequence
lcs :: String -> String -> String
lcs = memoize lcs'
  where lcs' xs'@(x:xs) ys'@(y:ys)
          | x == y    = x : lcs xs ys
          | otherwise = longer (lcs xs' ys) (lcs xs ys')
        lcs' _ _ = []
        longer as bs
          | length as > length bs = as
          | otherwise = bs


main :: IO ()
main = do
  let xs = "find the lights"
  let ys = "there are four lights"
  print $ lcs xs ys
  
