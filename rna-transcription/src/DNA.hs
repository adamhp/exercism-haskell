module DNA (toRNA) where

import Data.List (find)
import Data.Maybe (isJust, fromMaybe)

transpose :: Char -> Char
transpose 'G' = 'C'
transpose 'C' = 'G'
transpose 'A' = 'U'
transpose 'T' = 'A'

toRNA :: String -> Either Char String
toRNA xs = if isJust (find (\x -> x `notElem` ['G', 'C', 'A', 'T']) xs) 
    then Left (fromMaybe ' ' (find (\x -> x `notElem` ['G', 'C', 'A', 'T']) xs)) 
    else Right (map transpose xs)