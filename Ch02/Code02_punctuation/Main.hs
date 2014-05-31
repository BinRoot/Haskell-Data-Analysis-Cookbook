-- Cleans up a sentence
main :: IO ()
main = do
  let quote = "Deep Blue plays very good chess-so what?\
              \Does that tell you something about how we play chess?\
              \ No. Does it tell you about how Kasparov envisions,\
              \ understands a chessboard? (Douglas Hofstadter)"
  putStrLn $ (removePunctuation.replaceSpecialSymbols) quote

-- Removes punctuation
punctuations = ['!', '"', '#', '$', '%', '(', ')', '.', ',', '?']  
removePunctuation = filter (`notElem` punctuations)

-- Replaces some symbols with a space
specialSymbols = ['/', '-']
replaceSpecialSymbols = map $ (\c -> if c `elem` specialSymbols 
                                     then ' ' else c)
