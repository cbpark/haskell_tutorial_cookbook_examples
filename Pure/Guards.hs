module Main where

spaceship :: (Num a, Ord a) => a -> a
spaceship n | n < 0     = -1
            | n == 0    = 0
            | otherwise = 1

randomMaybeValue :: Int -> Maybe Int
randomMaybeValue n | n `mod` 2 == 0 = Just n
                   | otherwise      = Nothing

main :: IO ()
main = do
    print $ spaceship (-100)
    print $ spaceship 0
    print $ spaceship 17
    print $ randomMaybeValue 1
    print $ randomMaybeValue 2
