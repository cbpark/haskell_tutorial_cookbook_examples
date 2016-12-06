module Main where

main :: IO ()
main = do
    entireFileAsString <- readFile "temp.txt"
    print entireFileAsString
    let allWords = words entireFileAsString
    print allWords
