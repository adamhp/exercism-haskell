module SpaceAge (Planet(..), ageOn) where

--     Given an age in seconds, calculate how old someone would be on:

--    - Earth: orbital period 365.25 Earth days, or 31557600 seconds
--    - Mercury: orbital period 0.2408467 Earth years
--    - Venus: orbital period 0.61519726 Earth years
--    - Mars: orbital period 1.8808158 Earth years
--    - Jupiter: orbital period 11.862615 Earth years
--    - Saturn: orbital period 29.447498 Earth years
--    - Uranus: orbital period 84.016846 Earth years
--    - Neptune: orbital period 164.79132 Earth years

-- So if you were told someone were 1,000,000,000 seconds old, you should
-- be able to say that they're 31.69 Earth-years old.

-- 365.25 days = 1 year
-- 

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

orbitalPeriod :: Float -> Float
orbitalPeriod 1 = 31557600
orbitalPeriod proportion = proportion * (orbitalPeriod 1)

ageOn :: Planet -> Float -> Float
ageOn Earth seconds = seconds / (orbitalPeriod 1)
ageOn Mercury seconds = seconds / (orbitalPeriod 0.2408467)
ageOn Venus seconds = seconds / (orbitalPeriod 0.61519726)
ageOn Mars seconds = seconds / (orbitalPeriod 1.8808158)
ageOn Jupiter seconds = seconds / (orbitalPeriod 11.862615)
ageOn Saturn seconds = seconds / (orbitalPeriod 29.447498)
ageOn Uranus seconds = seconds / (orbitalPeriod 84.016846)
ageOn Neptune seconds = seconds / (orbitalPeriod 164.79132)