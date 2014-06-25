-- ghc --make Main.hs
-- ./Main -o output.svg -w 400

{-# LANGUAGE NoMonomorphismRestriction #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine (mainWith, B)

drawPath :: [(Double, Double)] -> Diagram B R2
drawPath vectors = fromOffsets . map r2 $ vectors

-- Diagramming a paht from a list of vectors
main = do
  rawInput <- readFile "input.txt"
  let vs = [ makeVector dir (read dist)
           | [dir, dist] <- map words (lines rawInput)]
  print vs
  mainWith $ drawPath vs

makeVector :: String -> Double -> (Double, Double)
makeVector "N" dist = (0, dist)
makeVector "NE" dist = (dist / sqrt 2, dist / sqrt 2)
makeVector "E" dist = (dist, 0)
makeVector "SE" dist = (dist / sqrt 2, -dist / sqrt 2)
makeVector "S" dist = (0, -dist)
makeVector "SW" dist = (-dist / sqrt 2, -dist / sqrt 2)
makeVector "W" dist = (-dist, 0)
makeVector "NW" dist = (-dist / sqrt 2, dist / sqrt 2)
makeVector _ _ = (0, 0)
