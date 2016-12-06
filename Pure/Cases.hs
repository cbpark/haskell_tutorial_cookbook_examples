module Main where

numberOpinion :: (Num a, Eq a) => a -> String
numberOpinion n = case n of
                      0 -> "Too low"
                      1 -> "just right"
                      _ -> "OK, that is a number"

main :: IO ()
main = do
    print $ numberOpinion 0
    print $ numberOpinion 1
    print $ numberOpinion 2
