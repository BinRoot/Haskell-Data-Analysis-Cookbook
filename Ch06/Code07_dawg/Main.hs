import qualified Data.DAWG.Static as D
import Network.HTTP (simpleHTTP, getRequest, getResponseBody)
import Data.Char (toLower, isAlphaNum, isSpace)
import Data.Maybe (isJust)
import System.CPUTime
import Data.List (isInfixOf)
import Control.DeepSeq (deepseq)

-- Querying strings using a directed acyclic word graph (DAWG)
main = do
  let url = "http://norvig.com/big.txt"
  body <- simpleHTTP (getRequest url) >>= getResponseBody
  
  let corp = corpus body
  print $ isJust $ D.lookup "hello" corp
  start <- getCPUTime
  print $ isJust $ D.lookup "goodbye" corp
  end <- getCPUTime
  let diff = (fromIntegral (end - start)) / (10^12)
  print diff
  print $ "hello" `isInfixOf` body
  start <- getCPUTime
  print $ "goodbye" `isInfixOf` body
  end <- getCPUTime
  let diff = (fromIntegral (end - start)) / (10^12)
  print diff

getWords :: String -> [String]
getWords str = words $ map toLower wordlike
  where wordlike = filter (\x -> isAlphaNum x || isSpace x) str

corpus :: String -> D.DAWG Char () ()
corpus str = D.fromLang $ getWords str
