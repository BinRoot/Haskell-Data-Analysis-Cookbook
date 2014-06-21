import qualified Numeric.Probability.Distribution as Dist
import Numeric.Probability.Distribution ((??), (?=<<), )

prob p = Dist.choose p True False

-- P (A) "formatting error"
a :: Dist.T Rational Bool
a = prob 0.2

-- P (B) "semantic error"
b :: Dist.T Rational Bool
b = prob 0.05

-- P (C | AB) "runs"
c :: Bool -> Bool -> Dist.T Rational Bool
c False False = prob 0.9
c False True = prob 0.5
c True False = prob 0.3
c True True = prob 0.1

-- P (D | C) "passes test cases"
d :: Bool -> Dist.T Rational Bool
d False = prob 0.1
d True = prob 0.4

-- P (E | C) "well written"
e :: Bool -> Dist.T Rational Bool
e False = prob 0.5
e True = prob 0.2

data Network = N { aVal :: Bool
                 , bVal :: Bool
                 , cVal :: Bool
                 , dVal :: Bool
                 , eVal :: Bool }
             deriving (Eq, Ord, Show) -- need all?
                      
bNetwork :: Dist.T Rational Network                      
bNetwork = do a' <- a
              b' <- b
              c' <- c a' b'
              d' <- d c'
              e' <- e c'
              return (N a' b' c' d' e')

-- Using Baysian networks to compute probabilities
main = print $ eVal ?? dVal ?=<< bNetwork
