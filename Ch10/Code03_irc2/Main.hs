{-# LANGUAGE OverloadedStrings #-}

import Network.SimpleIRC
import Data.Maybe
import qualified Data.ByteString.Char8 as B

-- Responding to IRC messages
onMessage :: EventFunc
onMessage s m = do
  case msg of
    "host?" ->  sendMsg s chan $ botMsg
    otherwise -> return ()
  where chan = fromJust $ mChan m
        msg = mMsg m
        host = case mHost m of
          Just h -> h
          Nothing -> "unknown"
        nick = case mNick m of
          Just n -> n
          Nothing -> "unknown user"
        botMsg = B.concat ["Hi ", nick, ", your host is ", host]

events = [(Privmsg onMessage)]

freenode = (mkDefaultConfig "irc.freenode.net" "awesome-bot")
            { cChannels = ["#haskelldata"] -- Channels to join on connect
            , cEvents   = events -- Events to bind
            }

main = connect freenode False True
