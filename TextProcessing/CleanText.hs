--  {-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Char       as C
import Data.List.Split (splitOn)
import Data.List.Utils (replace)

noiseCharacters :: String
noiseCharacters = ['[', ']', '{', '}', '\n', '\t', '&', '^',
                   '@', '%', '$', '#', ',']

substituteNoiseCharacters :: String -> String
substituteNoiseCharacters =
    map (\x -> if x `elem` noiseCharacters then ' ' else x)

cleanText :: String -> String
cleanText s = unwords $ filter (not . null) $
              splitOn " " $ substituteNoiseCharacters
              (replace "." " . "
                  (replace "," " , "
                      (replace ";" " ; " s)))

stopWords :: [String]
stopWords = ["a", "the", "that", "of", "an", "and"]

toLower' :: String -> String
toLower' = map (\x -> if isLower x then x else C.toLower x)

removeStopWords :: String -> String
removeStopWords s = unwords $ filter (\x -> toLower' x `notElem` stopWords) $
                    words s

main :: IO ()
main = do
    let ct = cleanText "The[]@] cat, and all the dogs, escaped&^. They were caught."
    print ct
    let nn = removeStopWords ct
    print nn
