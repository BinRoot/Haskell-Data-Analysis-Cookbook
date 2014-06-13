import Data.Digest.CityHash
import Data.ByteString.Char8 (pack)
import Data.Word (Word64)
import Data.LargeWord (Word128)

-- Hashing words using Google's Cityhash
main = do
  let str = "cityhash"
  print $ cityHash64 (pack str)
  print $ cityHash64WithSeed (pack str) (1 :: Word64)
  print $ cityHash64WithSeed (pack str) (2 :: Word64)
  print $ cityHash128 (pack str)
  print $ cityHash128WithSeed (pack str) (1 :: Word128)
  print $ cityHash128WithSeed (pack str) (2 :: Word128)
