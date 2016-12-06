module ChainedCalls where

doubleOddElements :: [Int] -> [Int]
doubleOddElements = map (\x -> if x `mod` 2 == 0 then x else 2 * x)

times10Elements :: [Int] -> [Int]
times10Elements = map (* 10)

main :: IO ()
main = do
    print $ doubleOddElements [0,1,2,3,4,5,6,7,8]
    let aList = [0,1,2,3,4,5]
    let newList = times10Elements $ doubleOddElements aList
    print newList
    let newList2 = (times10Elements . doubleOddElements) aList
    print newList2
