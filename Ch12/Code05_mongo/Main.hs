{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}

import Database.MongoDB
import Control.Monad.Trans (liftIO)

data Person = Person { first :: String 
                     , last :: String }

myData :: [Person]
myData = [ Person "Mercury" "Merci"
         , Person "Sylvester" "Smith"]

-- Exporting to HTML
main = do
    pipe <- runIOE $ connect (host "127.0.0.1")
    e <- access pipe master "test" (store myData)
    close pipe
    print e

store vals = insertMany "people" mongoList 
  where mongoList = map 
                    (\(Person f l) -> 
                      ["first" =: f, "last" =: l]) 
                    vals
