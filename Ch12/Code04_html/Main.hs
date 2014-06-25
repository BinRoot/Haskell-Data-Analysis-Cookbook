{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (forM_)

import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html.Renderer.Utf8 (renderHtml)
import qualified Data.ByteString.Lazy as BSL

dataInList :: Html -> [String] -> Html
dataInList label items = docTypeHtml $ do    
  H.head $ do
    H.title "Generating HTML from data"
  body $ do
    p label
    ul $ mapM_ (li . toHtml) items

-- Saving to MongoDB    
main = do    
  let movies = [ "2001: A Space Odyssey"
               , "Watchmen"
               , "GoldenEye" ]
  let html = renderHtml $ dataInList "list of movies" movies
  BSL.writeFile "index.html" $ html
