module PrettyJSON
  ( renderJValue,
  )
where

import Data.Bits (shiftR, (.&.))
import Data.Char (ord)
import Numeric (showHex)
import PrettyStub
import SimpleJSON
import Prelude hiding ((<>))

(<>) :: Doc -> Doc -> Doc
a <> b = undefined

char :: Char -> Doc
char c = undefined

enclose :: Char -> Char -> Doc -> Doc
enclose left right x = char left <> x <> char right

hexEscape :: Char -> Doc
hexEscape c
  | d < 0x10000 = smallHex d
  | otherwise = astral (d - 0x10000)
  where
    d = ord c

punctuate :: Doc -> [Doc] -> [Doc]
punctuate p [] = []
punctuate p [d] = [d]
punctuate p (d : ds) = (d <> p) : punctuate p ds

series :: Char -> Char -> (a -> Doc) -> [a] -> Doc
series open close item =
  enclose open close
    . fsep
    . punctuate (char ',')
    . map item

smallHex :: Int -> Doc
smallHex x =
  text "\\u"
    <> text (replicate (4 - length h) '0')
    <> text h
  where
    h = showHex x ""

astral :: Int -> Doc
astral n = smallHex (a + 0xd800) <> smallHex (b + 0xdc00)
  where
    a = (n `shiftR` 10) .&. 0x3ff
    b = n .&. 0x3ff

oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscapes of
  Just r -> text r
  Nothing
    | mustEscape c -> hexEscape c
    | otherwise -> char c
  where
    mustEscape c = c < ' ' || c == '\x7f' || c > '\xff'

simpleEscapes :: [(Char, String)]
simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
  where
    ch a b = (a, ['\\', b])

string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar

renderJValue :: JValue -> Doc
renderJValue (JBool True) = text "true"
renderJValue (JBool False) = text "false"
renderJValue JNull = text "null"
renderJValue (JNumber num) = double num
renderJValue (JString str) = string str
renderJValue (JArray ary) = series '[' ']' renderJValue ary
renderJValue (JObject obj) = series '{' '}' field obj
  where
    field (name, val) =
      string name
        <> text ": "
        <> renderJValue val