{-# LANGUAGE OverloadedStrings #-}
import Filesystem.Path.CurrentOS

import System.FSNotify
import Filesystem
import Filesystem.Path (filename)

-- Detecting real-time file changes
main :: IO ()
main = do
  -- let wd = "."
  wd <- getWorkingDirectory
  print wd
  man <- startManager
  watchTree man wd (const True) doWork
  putStrLn "press return to stop"
  getLine
  putStrLn "watching stopped, press return to exit"
  stopManager man
  getLine
  return ()
  
doWork :: Event -> IO ()  
doWork (Added filepath time) = 
  putStrLn $ (show $ filename filepath) ++ " added"
doWork (Modified filepath time) = 
  putStrLn $ (show $ filename filepath) ++ " modified"
doWork (Removed filepath time) = 
  putStrLn $ (show $ filename filepath) ++ " removed"
