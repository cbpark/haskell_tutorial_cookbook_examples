module MapExamples where

import           Data.Map (Map)
import qualified Data.Map as M

aTestMap :: Map String Int
aTestMap = M.fromList [("height", 120), ("weight", 15)]

getNumericValue :: Ord k => k -> Map k Int -> Int
getNumericValue key aMap = case M.lookup key aMap of
                               Nothing    -> -1
                               Just value -> value

main :: IO ()
main = do
  print $ getNumericValue "height" aTestMap
  print $ getNumericValue "age" aTestMap
