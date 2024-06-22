module Main where

import Utils.TxtFrame (enclose)

main :: IO ()
main = putStrLn (enclose "Hello, Haskell!")
