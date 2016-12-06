module Main where

ageToString :: Int -> String
ageToString age = if age < 21 then "minor" else "adult"

main :: IO ()
main = do
  print $ ageToString 15
  print $ ageToString 37
