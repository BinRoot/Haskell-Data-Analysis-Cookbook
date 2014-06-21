import Data.List (group, sort)
import MinHeap
import Network.HTTP (getRequest, getResponseBody, simpleHTTP)
import Data.Char (isAscii)
import Data.Maybe (fromJust)
import Data.Map (fromList, (!))

freq xs = map (\x -> (head x, length x)) . group . sort $ xs

-- Encoding a string using Huffman codes
main = do
  rsp <- simpleHTTP (getRequest "http://norvig.com/big.txt")
  html <- fmap (takeWhile isAscii) (getResponseBody rsp)
  let freqs = freq html
  let heap = foldr (\(v,w) -> insert (single v) w) empty freqs
  let tree = htree heap
  let m = fromList $ codes tree
  print $ encode "hello world" m
  
encode str m = concat $ map (m !) str
  
data HTree = HTree { value  :: Char
                   , left   :: HTree
                   , right  :: HTree }
           | Null 
           deriving (Eq, Show)

single v = HTree v Null Null

htree heap = if length (items heap) == 2
             then case fromJust (viewMin heap) of (a,b,c) -> a
             else htree $ insert newNode (w1 + w2) heap3
  where (min1, w1, heap2) = fromJust $ viewMin heap
        (min2, w2, heap3) = fromJust $ viewMin heap2
        newNode = HTree { value  = ' '
                        , left   = min1
                        , right  = min2 }
                  
codes htree = codes' htree ""
  where codes' (HTree v l r) str 
          | l==Null && r==Null = [(v, str)]
          | r==Null            = leftCodes
          | l==Null            = rightCodes
          | otherwise          = leftCodes ++ rightCodes
          where leftCodes = codes' l (str ++ "0")
                rightCodes = codes' r (str ++ "1")
