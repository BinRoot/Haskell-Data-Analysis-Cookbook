import Network.HTTP
import Network.URI (parseURI)
import Text.XML.HXT.Core
import Text.HandsomeSoup
import Data.Maybe (fromJust)

myRequestURL = "http://www.virginia.edu/cgi-local/ldapweb"
myRequest :: String -> Request_String
myRequest query = Request { 
    rqURI = fromJust $ parseURI myRequestURL
  , rqMethod = POST
  , rqHeaders = [ mkHeader HdrContentType "text/html"
                , mkHeader HdrContentLength $ show $ length body ]
  , rqBody = body
  }
  where body = "whitepages=" ++ query

-- Performs a POST request
main :: IO ()
main = do
  response <- simpleHTTP $ myRequest "poon"
  html <- getResponseBody response
  let doc = readString [withParseHTML yes, withWarnings no] html
  rows <- runX $ doc >>> css "td" //> getText
  print rows

