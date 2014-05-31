import Data.Char (isSpace)

-- Trims whitespace
trim :: String -> String
trim = f . f
  where f = reverse . dropWhile isSpace

main :: IO ()
main = putStrLn $ trim " wahoowa! "
