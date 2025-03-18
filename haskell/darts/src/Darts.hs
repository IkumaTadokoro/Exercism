module Darts (score) where

-- 半径によってスコアが決まるので、三平方の定理を使って半径を算出し、パターンマッチでかえす

score :: Float -> Float -> Int
score x y = case sqrt (x ** 2 + y ** 2) of
  r
    | r <= 1 -> 10
    | r <= 5 -> 5
    | r <= 10 -> 1
    | otherwise -> 0
