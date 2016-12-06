module CommonWords where

import Data.Char (toLower)
import Data.Set  (Set, fromList, intersection, toList)

fileToWords :: FilePath -> IO (Set String)
fileToWords fileName = do
    fileText <- readFile fileName
    return $ (fromList . words) (map toLower fileText)

commonWords :: FilePath -> FilePath -> IO [String]
commonWords file1 file2 = do
    words1 <- fileToWords file1
    words2 <- fileToWords file2
    return $ toList (intersection words1 words2)

commonWords2 :: FilePath -> FilePath -> IO [String]
commonWords2 file1 file2 =
    fileToWords file1 >>= \f1 ->
    fileToWords file2 >>= \f2 ->
    return $  toList (intersection f1 f2)

commonWords3 :: FilePath -> FilePath -> IO [String]
commonWords3 file1 file2 =
    (\f1 f2 -> toList (intersection f1 f2))
    <$> fileToWords file1
    <*> fileToWords file2

main :: IO ()
main = do
    cw <- commonWords "text1.txt" "text2.txt"
    print cw
    cw2 <- commonWords "text1.txt" "text2.txt"
    print cw2
    cw3 <- commonWords "text1.txt" "text2.txt"
    print cw3
