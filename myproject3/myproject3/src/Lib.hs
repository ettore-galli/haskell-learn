module Lib
  ( someFunc,
    wrapString,
  )
where

someFunc :: IO ()
someFunc = putStrLn "AAAAAAAAA"

wrapString :: String -> String -> String -> String
wrapString leftWrap rightWrap content = leftWrap ++ content ++ rightWrap