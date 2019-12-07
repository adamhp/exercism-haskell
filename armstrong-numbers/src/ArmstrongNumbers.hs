module ArmstrongNumbers (armstrong) where

digits :: Integral x => x -> [x]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

armstrong :: Integral a => a -> Bool
armstrong a
    | sum (map (^ length x) x) == a = True
    | otherwise = False
        where
            x = digits a
