module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, adjust)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = fmap (foldr (adjust (+1)) initialCounts) . traverse charToNucleotide
  where
    initialCounts = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

    charToNucleotide :: Char -> Either String Nucleotide
    charToNucleotide 'A' = Right A
    charToNucleotide 'C' = Right C
    charToNucleotide 'G' = Right G
    charToNucleotide 'T' = Right T
    charToNucleotide c   = Left $ "Invalid nucleotide: " ++ [c]
