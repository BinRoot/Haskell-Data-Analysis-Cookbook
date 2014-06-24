import Network (listenOn, withSocketsDo, accept, PortID(..), Socket)
import System.Environment (getArgs)
import System.IO (hSetBuffering, hGetLine, hPutStrLn, BufferMode(..), Handle)
import Control.Concurrent (forkIO)

-- Communicating in real-time with sockets
main :: IO ()
main = withSocketsDo $ do
  let port = PortNumber 9001
  socket <- listenOn port
  putStrLn "Listening..."
  sockHandler socket

sockHandler :: Socket -> IO ()
sockHandler socket = do
  (h, _, _) <- accept socket
  putStrLn "Connected!"
  hSetBuffering h LineBuffering
  forkIO $ process h
  forkIO $ respond h
  sockHandler socket

respond h = withSocketsDo $ do
  txt <- getLine
  hPutStrLn h txt
  respond h

process :: Handle -> IO ()
process h = do
  line <- hGetLine h
  print line
  process h
