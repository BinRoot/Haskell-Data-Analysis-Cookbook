import Data.Char (intToDigit, chr, ord) 
import Numeric (showIntAtBase)

-- Converts a number n to the base b
n `inBase` b = showIntAtBase b numToLetter n ""

numToLetter :: Int -> Char
numToLetter n
  | n < 10 = intToDigit n
  | otherwise = chr (ord 'a' + n - 10)

main :: IO ()
main = do
  putStrLn $ 8 `inBase` 12
  putStrLn $ 10 `inBase` 12
  putStrLn $ 12 `inBase` 12
  putStrLn $ 47 `inBase` 12
