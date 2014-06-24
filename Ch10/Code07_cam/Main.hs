--sudo apt-get install libopencv-dev libsdl1.2-dev ftgl-dev
--cabal install cv-combinators

import AI.CV.ImageProcessors

import qualified AI.CV.OpenCV.CV as CV
import qualified Control.Processor as Processor
import Control.Processor((--<))
import AI.CV.OpenCV.Types (PImage)
import AI.CV.OpenCV.CxCore(CvRect(..), CvSize(..))

import Prelude hiding (id)
import Control.Arrow ((&&&), (***))
import Control.Category ((>>>), id)

captureDev :: ImageSource
--captureDev = videoFile "./video.mpeg"
captureDev = camera 0

resizer :: ImageProcessor
resizer = resize 320 240 CV.CV_INTER_LINEAR

edges :: ImageProcessor
edges = canny 30 190 3

faceDetect :: Processor.IOProcessor PImage [CvRect]
faceDetect = haarDetect "/usr/share/opencv/haarcascades/haarcascade_frontalface_alt.xml" 1.1 3 CV.cvHaarFlagNone (CvSize 20 20)
  
eyeDetect :: Processor.IOProcessor PImage [CvRect]
eyeDetect = haarDetect "/usr/share/opencv/haarcascades/haarcascade_eye.xml" 1.1 3 CV.cvHaarFlagNone (CvSize 20 20)

faceRects = (id &&& faceDetect) >>> drawRects
eyeRects = (id &&& eyeDetect) >>> drawRects

start = captureDev >>> resizer --< (faceRects *** eyeRects) >>> (window 0 *** window 1)

-- Detecting faces and eyes through a camera stream
main :: IO ()
main = runTillKeyPressed start
