module CollatzConjecture (collatz) where

collatzStep :: Integer -> Integer -> Maybe Integer
collatzStep n i
    | n < 0 = Nothing
    | n == 0 = Nothing
    | n == 1 = Just i
    | even n = collatzStep (n `div` 2) (i+1)
    | odd n = collatzStep ((3*n) + 1) (i+1)

collatz :: Integer -> Maybe Integer
collatz n = collatzStep n 0