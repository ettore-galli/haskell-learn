module Utils.TxtFrame (enclose) where

import Text.Printf

enclose :: String -> String
enclose = printf "[%s]"