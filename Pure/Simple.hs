module Main where

sum2 :: Num a => a -> a -> a
sum2 x y = x + y

main :: IO ()
main = putStrLn ("1 + 2 = " ++ show (sum2 1 2))
