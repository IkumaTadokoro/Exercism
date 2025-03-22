module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just $ fromIntegral $ length $ takeWhile (/= 1) $ collatzSeq n

collatzSeq :: Integer -> [Integer]
collatzSeq = iterate nextCollatz
  where
    nextCollatz n
      | n == 1 = 1
      | even n = n `div` 2
      | otherwise = 3 * n + 1
