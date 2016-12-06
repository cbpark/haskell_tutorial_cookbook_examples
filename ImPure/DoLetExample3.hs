module DoLetExample3 where

example3 :: IO String
example3 = putStrLn "Enter an integer number:" >> getLine

example4 :: String -> IO ()
example4 mv = do
    let number = (read mv :: Int) + 2
    putStrLn $ "Number plus 2 = " ++ show number

main :: IO ()
main = example3 >>= example4
