module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = 
  sum . nub $ factors >>= multiplesUnder
  where
    multiplesUnder 0 = []
    multiplesUnder f = takeWhile (< limit) [f, f*2..]
