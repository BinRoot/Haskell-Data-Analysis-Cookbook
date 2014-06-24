import Control.Concurrent
import qualified Data.Map as M

-- Killing forked threads
main = download (M.empty :: M.Map Int [ThreadId])

download m = do
  input <- (getLine >>= return . words)
  respond m input >>= download

respond m ["d", nstr] = do
  putStrLn "Starting download..."
  let n = read nstr :: Int
  threadId <- forkIO $ massiveDownload n
  return $ M.insertWith (++) n [threadId] m

respond m ["k", nstr] = do
  let n = read nstr :: Int
  case (M.lookup n m) of
    Just threads -> do 
      putStrLn "Killing download(s)..."
      mapM_ killThread threads
      download $ M.delete n m
    Nothing -> do
      putStrLn "No such download"
      download m

respond m _ = do
  putStrLn "Type `d #` to start a download or `k #` to kill it."
  return m

massiveDownload n = do
  threadDelay $ 10 * 1000000
  putStrLn $ "[Download " ++ (show n) ++" complete!]"

{-

d 1
Starting download...
d 2
Starting download...
d 3
Starting download...
k 1
Killing download(s)...
[Download 2 complete!]
[Download 3 complete!]

-}
