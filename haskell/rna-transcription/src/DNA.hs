module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = mapM toRNA'
  where
    toRNA' 'G' = Right 'C'
    toRNA' 'C' = Right 'G'
    toRNA' 'T' = Right 'A'
    toRNA' 'A' = Right 'U'
    toRNA' x   = Left x
