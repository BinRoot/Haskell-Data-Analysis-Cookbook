import Network.HTTP
import Network.URI
import Text.XML.HXT.Core
import Text.HandsomeSoup

type SearchResult = Either SearchResultErr [String]

data SearchResultErr = NoResultsErr | TooManyResultsErr | UnknownErr deriving (Show, Eq)

-- Searching through a database system.
main :: IO ()
main = main' "a"

main' query = do
  print query
  doc <- getDoc query
  searchResult <- scanDoc doc
  print searchResult
  case searchResult of
    Left TooManyResultsErr -> main' (nextDeepQuery query)
    _ -> if (nextQuery query) >= endQuery then print "done!" else main' (nextQuery query)

getDoc query = do  
  rsp <- simpleHTTP $ myRequest query
  html <- getResponseBody rsp
  return $ readString [withParseHTML yes, withWarnings no] html
    
scanDoc doc = do
  errMsg <- runX $ doc >>> css "h3" //> getText
  case errMsg of 
    [] -> do text <- runX $ doc >>> css "td" //> getText 
             return $ Right text
    "Error: Sizelimit exceeded":_ -> return $ Left TooManyResultsErr
    "Too many matching entries were found":_ -> return $ Left TooManyResultsErr
    "No matching entries were found":_ -> return $ Left NoResultsErr
    _ -> return $ Left UnknownErr

myRequestURL = "http://www.virginia.edu/cgi-local/ldapweb"
myRequest :: String -> Request_String
myRequest query = Request { 
    rqURI = case parseURI myRequestURL of Just u -> u
  , rqMethod = POST
  , rqHeaders = [ mkHeader HdrContentType "text/html"
                , mkHeader HdrContentLength $ show $ length body ]
  , rqBody = body
  }
  where body = "whitepages=" ++ query

nextDeepQuery query = query ++ "a"

nextQuery "z" = endQuery
nextQuery query = if last query == 'z'
                  then nextQuery $ init query
                  else init query ++ [succ $ last query]

endQuery = [succ 'z']
