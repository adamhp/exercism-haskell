module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.List (find)
import Data.Maybe (isJust)
import Data.Map (Map, insertWith', fromList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)
fromChar :: Char -> Nucleotide
fromChar 'A' = A
fromChar 'C' = C
fromChar 'G' = G
fromChar 'T' = T

increment :: Char -> Map Nucleotide Integer -> Map Nucleotide Integer
increment k = insertWith' (+) (fromChar k) 1

nucleotideCounts :: String -> Either String (Map Nucleotide Integer)
nucleotideCounts xs = 
    if isJust (find (\x -> x `notElem` ['G', 'C', 'A', 'T']) xs) 
        then Left "Invalid" 
        else Right (foldl (flip increment) (fromList [(A, 0), (C, 0), (G, 0), (T, 0)]) xs)