module SumOfMultiples (sumOfMultiples) where

-- Given a number, find the sum of all the unique multiples of particular 
--   numbers up to but not including that number.
-- If we list all the natural numbers below 20 that are multiples of 3 or 5, 
--   we get 3, 5, 6, 9, 10, 12, 15, and 18.
-- The sum of these multiples is 78.

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter (isMultiple factors) [1..(limit-1)]

isMultiple :: [Integer] -> Integer -> Bool
isMultiple [] _ = False
isMultiple [y] x 
    | y == 0 = False
    | x `mod` y == 0 = True
    | otherwise = False
isMultiple (y:ys) x = isMultiple ys x || x `mod` y == 0