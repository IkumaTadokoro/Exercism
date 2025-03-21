module Bob (responseFor) where

import Data.Char (isAlpha, isSpace, isUpper)

responseFor :: String -> String
responseFor xs
  | isEmpty xs = "Fine. Be that way!"
  | isYelling xs && isQuestion xs = "Calm down, I know what I'm doing!"
  | isQuestion xs = "Sure."
  | isYelling xs = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    isYelling s = any isAlpha s && all isUpper (filter isAlpha s)
    isQuestion s = last (filter (not . isSpace) s) == '?'
    isEmpty = all isSpace
