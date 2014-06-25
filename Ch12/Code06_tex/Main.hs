{-# LANGUAGE OverloadedStrings #-}

import Text.LaTeX
import Text.LaTeX.Base.Class
import Text.LaTeX.Base.Syntax
import qualified Data.Map as M

-- Exporting to LaTeX
main :: IO ()
main = execLaTeXT myDoc >>= renderFile "output.tex"

myDoc :: Monad m => LaTeXT_ m
myDoc = do
 thePreamble
 document theBody

thePreamble :: Monad m => LaTeXT_ m
thePreamble = do
 documentclass [] article
 author "Dr. Databender"
 title "Data Analyst"

myData :: [(Int,Int)]
myData = [ (1, 50)
         , (2, 100)
         , (3, 150)]

theBody :: Monad m => LaTeXT_ m
theBody = do
 maketitle
 section "Fancy Data Table"
 bigskip
 center $ underline $ textbf "Table of Points"
 center $ tabular Nothing [RightColumn, VerticalLine, LeftColumn] $ do
   textbf "Time" & textbf "Cost"
   lnbk
   hline
   mapM_ (\(t, c) -> do texy t & texy c; lnbk) myData
