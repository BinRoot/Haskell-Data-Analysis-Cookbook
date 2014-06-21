import Control.Monad (replicateM)
import System.Random (randomR, getStdRandom)

type Inputs = [Float]
type Weights = [Float]
type Threshold = Float
type Output = Float
type Expected = Float
type Actual = Float
type Delta = Float
type Interval = Int
type Step = (Weights, Interval)

output :: Inputs -> Weights -> Threshold -> Output
output xs ws t 
  | (dot xs ws) > t = 1
  | otherwise = 0
  where dot as bs = sum $ zipWith (*) as bs
        
adjustWeights :: Inputs -> Weights -> Expected -> Actual -> Weights
adjustWeights xs ws ex ac = add ws delta
  where delta = map (err * learningRate *) xs
        add = zipWith (+)
        err = ex - ac
        learningRate = 0.1

step :: Inputs -> Weights -> Expected -> Weights
step xs ws ex = adjustWeights xs ws ex (output xs ws t)
  where t = 0.2
        
epoch :: [(Inputs, Expected)] -> Weights -> (Weights, Delta)
epoch inputs ws = (newWeights, delta)
  where newWeights = foldl (\acc (xs, ex) -> step xs acc ex) ws inputs
        delta = (sum (absSub newWeights ws)) / length' ws
        absSub as bs = map abs $ zipWith (-) as bs
        length' = fromIntegral . length

run :: [(Inputs, Expected)] -> Weights -> Interval -> Step
run inputs ws n
  | delta == 0.0 = (newWeights, n)
  | otherwise = run inputs newWeights (n+1)
  where (newWeights, delta) = epoch inputs ws


initialWeights :: Int -> IO [Float]
initialWeights nb = do
  let interval = randomR (-0.5,0.5)
  (replicateM nb (getStdRandom interval))        

-- Classifying points using a neural network
main :: IO ()
main = do
  w <- initialWeights 2
  let (ws,i) = run [([0,0],0),([0,1],0),([1,0],0),([1,1],1)] w 1
  print (ws,i)
