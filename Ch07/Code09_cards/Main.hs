import qualified Numeric.Probability.Distribution as Dist
import Numeric.Probability.Distribution ((??))
import Control.Monad.Trans.State (StateT(StateT, runStateT), evalStateT)
import Control.Monad (replicateM)
import Data.List (delete)

data Suit = Club | Spade | Heart | Diamond
          deriving (Eq,Ord,Show,Enum)

data Rank = Plain Int | Jack | Queen | King | Ace
          deriving (Eq,Ord,Show)

type Card = (Rank,Suit)

plains :: [Rank]
plains = map Plain [2..10]

faces :: [Rank]
faces = [Jack,Queen,King,Ace]

isFace :: Card -> Bool
isFace (r,_) = r `elem` faces

isPlain :: Card -> Bool
isPlain (r,_) = r `elem` plains

ranks :: [Rank]
ranks = plains ++ faces

suits :: [Suit]
suits = [Club, Spade, Heart, Diamond]

deck :: [Card]
deck = [ (r,s) | r <- ranks, s <- suits ]

selectOne :: (Fractional prob, Eq a) =>
   StateT ([a]) (Dist.T prob) a
selectOne =
   StateT $ Dist.uniform . removeEach

select :: (Fractional prob, Eq a) => Int -> [a] -> Dist.T prob [a]
select n = evalStateT (replicateM n selectOne)

removeEach xs = zip xs (map (flip delete xs) xs)

-- Finding probabilities in playing cards
main = do
  print $ Dist.just [(Plain 3, Heart), (Plain 3, Diamond)] ?? select 2 deck
