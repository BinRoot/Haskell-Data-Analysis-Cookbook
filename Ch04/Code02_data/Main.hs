{-# LANGUAGE DeriveGeneric #-}

import GHC.Generics (Generic)
import Data.Hashable

data Point = Point Int Int
           deriving (Eq, Generic)
instance Hashable Point

-- Hashing data types
main = do
  let p1 = Point 1 1
  let p2 = Point 1 1
  let p3 = Point 3 5

  if p1 == p2
    then putStrLn "p1 = p2"
    else putStrLn "p1 /= p2"
  if hash p1 == hash p2
    then putStrLn "hash p1 = hash p2"
    else putStrLn "hash p1 /= hash p2"

  if p1 == p3
    then putStrLn "p1 = p3"
    else putStrLn "p1 /= p3"
  if hash p1 == hash p3
    then putStrLn "hash p1 = hash p3"
    else putStrLn "hash p1 /= hash p3"
