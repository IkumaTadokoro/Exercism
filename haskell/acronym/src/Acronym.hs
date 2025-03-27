module Acronym (abbreviate) where

import Data.Char (isAlpha, isUpper, toUpper)

abbreviate :: String -> String
abbreviate = concatMap initials . words . sanitize

initials :: String -> String
initials [] = []
initials (x:xs) = toUpper x : if all isUpper xs then [] else filter isUpper xs

sanitize :: String -> String
sanitize = map replaceNonAlpha
  where
    replaceNonAlpha :: Char -> Char
    replaceNonAlpha '\'' = '\''
    replaceNonAlpha x
      | isAlpha x = x
      | otherwise = ' '
