module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = 
  sum $ nub $ findMultiples factors limit

findMultiples :: [Integer] -> Integer -> [Integer]
findMultiples factors limit = filter isMultiple [1..limit-1]
  where
    nonZeroFactors = filter (> 0) factors
    isMultiple n = n > 0 && any (\f -> n `mod` f == 0) nonZeroFactors
