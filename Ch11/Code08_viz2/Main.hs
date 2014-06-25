-- runhaskell Main.hs > graph.dot
-- dot -Tpng graph.dot > graph.png

import Data.Text.Lazy (Text, pack, unpack)
import Data.Graph.Inductive (Gr, mkGraph)
import Data.GraphViz (
  GraphvizParams(..),
  GlobalAttributes(
    GraphAttrs,
    NodeAttrs,
    EdgeAttrs
    ),
  X11Color(Blue, Orange, White),
  nonClusteredParams,
  globalAttributes,
  fmtNode,
  fmtEdge,
  graphToDot
  )
import Data.GraphViz.Printing (toDot, renderDot)
import Data.GraphViz.Attributes.Complete

myGraph :: Gr Text Text
myGraph = mkGraph [ (1, pack "Haskell")
                  , (2, pack "Data Analysis") 
                  , (3, pack "Haskell Data Analysis")
                  , (4, pack "Profit!") ] 
         [ (1, 3, pack "learn") 
         , (2, 3, pack "learn")
         , (3, 4, pack "???")]

myParams :: GraphvizParams n Text Text () Text
myParams = nonClusteredParams { 
    isDirected       = True
  , globalAttributes = [myGraphAttrs, myNodeAttrs, myEdgeAttrs]
  , fmtNode          = myFN
  , fmtEdge          = myFE
  }
  where myGraphAttrs = GraphAttrs [ RankDir FromLeft
                                  , BgColor [toWColor Blue]]
        myNodeAttrs = NodeAttrs [ Shape BoxShape
                                , FillColor [toWColor Orange]
                                , Style [SItem Filled []]]
        myEdgeAttrs = EdgeAttrs [ Weight (Int 10)
                                , Color [toWColor White]
                                , FontColor (toColor White)]
        myFN (n,l) = [(Label . StrLabel) l]
        myFE (f,t,l) = [(Label . StrLabel) l]

-- Customizing the looks of a graphical network diagram
main :: IO ()
main = putStr $ unpack $ renderDot $ toDot $ graphToDot myParams myGraph
