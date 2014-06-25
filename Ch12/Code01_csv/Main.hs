import Data.Csv
import qualified Data.ByteString.Lazy as BSL

myData :: [(Char, Int)]
myData = zip ['A'..'Z'] [1..]

-- Exporting to CSV
main = BSL.writeFile "letters.csv" $ encode myData
