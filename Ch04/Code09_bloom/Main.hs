import Data.BloomFilter (fromListB, elemB, emptyB, insertB)
import Data.BloomFilter.Hash (cheapHashes)
import Data.Map (Map, empty, insertWith)
import qualified Data.Map as Map

filt = fromListB (cheapHashes 3) 1024 ["foo", "bar", "quux"]

-- Using a Bloom filter
main = do
  let strands = ["GAT", "GATC", "CGT", "GAT", "GAT", "CGT", "GAT", "CGT"]
  print $ snd $ removeUniques strands
  
removeUniques strands = foldl bloomMapCheck (emptyBloom, emptyMap) strands
  where emptyBloom = emptyB (cheapHashes 3) 1024
        emptyMap = empty :: Map String Int
        bloomMapCheck (b, m) x
          | elemB x b = (b, insertWith (+) x 1 m)
          | otherwise = (insertB x b, m)
