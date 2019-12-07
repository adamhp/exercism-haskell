module Bob (responseFor) where
import qualified Data.Text as T
import           Data.Text (Text, pack, unpack, takeEnd, strip)
import Data.Char (isUpper, isDigit, isSymbol, isPunctuation, isSpace)

allCaps :: Text -> Bool
allCaps text = not (all (\x -> isDigit x || isSpace x || isPunctuation x || isSymbol x) (unpack text)) && all (\x -> isDigit x || isUpper x || isPunctuation x || isSpace x || isSymbol x) (unpack text)

exclamation :: Text -> Bool
exclamation xs = pack "!" == takeEnd 1 xs

question :: Text -> Bool
question xs = pack "?" == takeEnd 1 xs

responseFor :: Text -> Text
responseFor text
    | all isSpace (unpack (strip text)) = pack "Fine. Be that way!"
    | allCaps (strip text) && exclamation (strip text) = pack "Whoa, chill out!"
    | allCaps (strip text) && question (strip text) = pack "Calm down, I know what I'm doing!"
    | allCaps (strip text) = pack "Whoa, chill out!"
    | question (strip text) = pack "Sure."
    | otherwise = pack "Whatever."