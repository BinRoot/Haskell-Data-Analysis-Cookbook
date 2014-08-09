import qualified Data.BloomFilter as BF
import Data.BloomFilter.Hash (cheapHashes)
import Data.Map (Map, empty, insertWith)
import qualified Data.Map as Map

filt = BF.fromList (cheapHashes 3) 1024 ["foo", "bar", "quux"]

-- Using a Bloom filter
main = do
  let strands = ["GAT", "GATC", "CGT", "GAT", "GAT", "CGT", "GAT", "CGT"]
  print $ snd $ removeUniques strands
  
removeUniques strands = foldl bloomMapCheck (emptyBloom, emptyMap) strands
  where emptyBloom = BF.empty (cheapHashes 3) 1024
        emptyMap = empty :: Map String Int
        bloomMapCheck (b, m) x
          | BF.elem x b = (b, insertWith (+) x 1 m)
          | otherwise = (BF.insert x b, m)
