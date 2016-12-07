module Main where

import Data.Either.Unwrap (fromRight)
import Text.CSV           (CSV, parseCSVFromFile)

readCsvFile :: FilePath -> IO CSV
readCsvFile fname = do
    c <- parseCSVFromFile fname
    return $ fromRight c

main :: IO ()
main = do
    c <- readCsvFile "test.csv"
    print  c
    print $ map head c
    let header:rows = c
    print header
    print rows
