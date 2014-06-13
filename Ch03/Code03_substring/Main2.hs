{-# LANGUAGE OverloadedStrings #-}

import Data.ByteString (isInfixOf)

main = do
  print $ isInfixOf "scraf" "swedish scraf mafia"
  print $ isInfixOf "flute" "swedish scraf mafia"
