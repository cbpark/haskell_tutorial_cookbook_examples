module Main where

import Control.Exception

-- catchAny from Michael Snoyman's aticle:
-- (https://www.schoolofhaskell.com/user/snoyberg/general-haskell/exceptions/catching-all-exceptions:
catchAny :: IO a -> (SomeException -> IO a) -> IO a
catchAny = Control.Exception.catch

{-
safeFileReader :: FilePath -> IO String
safeFileReader fPath = do
    entireFileAsString <- catchAny (readFile "temp.txt") $ \err -> do
        putStrLn $ "Error: " ++ show err
        return ""
    return entireFileAsString
-}
safeFileReader :: FilePath -> IO String
safeFileReader fPath = catchAny (readFile fPath) $ \err -> do
    putStrLn $ "Error: " ++ show err
    return ""

main :: IO ()
main = do
    fContents <- safeFileReader "temp.txt"
    print fContents
    print $ words fContents
