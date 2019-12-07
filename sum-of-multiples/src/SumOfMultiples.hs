module SumOfMultiples (sumOfMultiples) where

-- Given a number, find the sum of all the unique multiples of particular 
--   numbers up to but not including that number.
-- If we list all the natural numbers below 20 that are multiples of 3 or 5, 
--   we get 3, 5, 6, 9, 10, 12, 15, and 18.
-- The sum of these multiples is 78.

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = error "You need to implement this function."
-- sumOfMultiples = sum [ i | i <- [1..limit], ]

anyDivisible :: [Integer] -> Integer -> Bool
anyDivisible factors n
    | any [ i | i <- factors, mod i ] = True
    | otherwise = False