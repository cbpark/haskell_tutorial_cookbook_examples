module Main where

head' :: [a] -> a
head' (x:_) = x

tail' :: [a] -> [a]
tail' (_:xs) = xs

doubleList :: Num a => [a] -> [a]
doubleList []     = []
doubleList (x:xs) = (* 2) x : doubleList xs

bumpList :: Num a => a -> [a] -> [a]
bumpList _ []     = []
bumpList n (x:xs) = n * x : bumpList n xs

map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (x:xs) = f x : map' f xs

main :: IO ()
main = do
    print $ head' ["bird","dog","cat"]
    print $ tail' [0,1,2,3,4,5]
    print $ doubleList [0..5]
    print $ bumpList 3 [0..5]
    print $ map' (* 7) [0..5]
    print $ map' (+ 1.1) [0..5]
    print $ map' (\x -> (x + 1) * 2) [0..5]
