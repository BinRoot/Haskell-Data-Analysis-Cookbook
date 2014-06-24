-- sudo apt-get install libdevil-dev
-- ghc -O -threaded -rtsopts --make repa.hs
-- time ./repa sunflower.png +RTS -N2 -H

import System.Environment (getArgs)
import Data.Word (Word8)
import qualified Data.Array.Repa as R
import Data.Array.Repa hiding ((++))
import Data.Array.Repa.IO.DevIL (runIL, readImage, 
  writeImage, IL, Image(RGB))
import Data.Array.Repa.Repr.ForeignPtr (F)

-- Manipulating images in parallel using Repa
main = do
  let image1 = "image1.png"
  let image2 = "image2.png"
  runIL $ do
    (RGB a) <- readImage image1
    (RGB b) <- readImage image2
    imageOut <- (computeP $ intersect a b) :: IL (Array F DIM3 Word8)
    writeImage ("output.png") (RGB imageOut)

intersect :: Array F DIM3 Word8 -> 
             Array F DIM3 Word8 -> 
             Array D DIM3 Word8
intersect a b = R.zipWith (\w1 w2 -> merge w1 w2) a b
  where merge w1 w2 = if w1 == w2 then 0 else 255
