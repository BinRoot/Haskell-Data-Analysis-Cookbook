import Network (connectTo, withSocketsDo, PortID(..))
import System.Environment (getArgs)
import System.IO (hSetBuffering, hPutStrLn, hGetLine, BufferMode(..))
import Control.Concurrent (forkIO)

main = withSocketsDo $ do
  let port = PortNumber 9001
  h <- connectTo "localhost" port
  putStrLn "Connected!"
  hSetBuffering h LineBuffering
  forkIO $ respond h
  forkIO $ process h
  loop

loop = loop

respond h = do
  txt <- getLine
  hPutStrLn h txt
  respond h  

process h = do
  line <- hGetLine h
  print line
  process h
