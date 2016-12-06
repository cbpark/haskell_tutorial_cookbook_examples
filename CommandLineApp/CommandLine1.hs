module Main where

import Data.Char (toUpper)

main :: IO ()
main = do
    putStrLn "Enter a line of text for test 1:"
    s <- getLine
    putStrLn $ "As upper case:\t" ++ map toUpper s
    main
