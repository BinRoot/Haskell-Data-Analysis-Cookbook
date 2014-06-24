{-#LANGUAGE ScopedTypeVariables#-}
module Main where
import CV.Image (loadImage, rgbToGray, getSize)
import CV.Video (captureFromCam, streamFromVideo)
import Utils.Stream (runStream_, takeWhileS, sideEffect)
import CV.HighGUI (showImage, waitKey)
import CV.TemplateMatching (simpleTemplateMatch, MatchType(..))
import CV.ImageOp ((<#))
import CV.Drawing (circleOp, ShapeStyle(..))

-- Streaming camera frames for template matching
main = do
  Just t <- loadImage "lena.jpg"
  Just c <- captureFromCam 0
  runStream_ . sideEffect (process t) . 
    takeWhileS (\_ -> True) $ streamFromVideo c

process t img = do
  let gray = rgbToGray img
  let ((mx, my), _) = simpleTemplateMatch CCOEFF_NORMED gray t
  let circleSize = (fst (getSize t)) `div` 2
  let circleCenter = (mx + circleSize, my + circleSize)
  showImage "test" (img <# circleOp (0,0,0) 
    circleCenter circleSize (Stroked 3))
  waitKey 100
  return ()
