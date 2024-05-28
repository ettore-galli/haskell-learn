import Data.ByteString.Lazy (compareLength)
import Data.List
import Debug.Trace (trace)
import GHC.TypeLits (Div)
import Text.Read.Lex (Number)

-- Example

mydrop :: (Integral n, Ord a) => n -> [a] -> [a]
mydrop n xs =
  if (n <= 0) || null xs
    then xs
    else mydrop (n - 1) (tail (reverse xs))

mySplitImpl :: (Integral n, Ord a) => n -> ([a], [a]) -> ([a], [a])
mySplitImpl n (x, y : ys) =
  if (n <= 0) || null ys
    then (x, y : ys)
    else mySplitImpl (n - 1) (x ++ [y], ys)

mySplit :: (Integral n, Ord a) => n -> [a] -> ([a], [a])
mySplit n x = mySplitImpl n ([], x)

maybeExtractor :: a -> Maybe a -> a
maybeExtractor _ (Just x) = x
maybeExtractor fallback Nothing = fallback

type CustomerId = Integer

data Customer = Customer
  { cid :: CustomerId,
    name :: String,
    address :: String
  }
  deriving (Show)

data Result a = Yields a | Error String deriving (Show)

data Operation = Div -- Sum | Sub | Mult | Div

perform :: Operation -> Float -> Float -> Result Float
perform Div _ 0 = Error "Division by zero"
perform Div x y = Yields (x / y)

data Fruit = Apple | Orange | Banana deriving (Show)

apple :: String
apple = "apple"

orange :: String
orange = "orange"

whichFruit :: String -> Fruit
whichFruit f
  | f == apple = Apple
  | f == orange = Orange
  | otherwise = Banana

numel :: [a] -> Integer
numel [] = 0
numel (x : xs) = 1 + numel xs

mean :: [Float] -> Float
mean x = sum x / fromIntegral (numel x)

pali :: [a] -> [a]
pali x = x ++ reverse x

ispali :: (Ord a) => [a] -> Bool
ispali [] = True
ispali [n] = True
ispali x = (head x == last x) && ispali (init (tail x))

sortlen :: [[a]] -> [[a]]
sortlen = sortBy (\x y -> compare (length x) (length y))

interspersex :: (Show a) => a -> [[a]] -> [a]
interspersex sep inp | trace ("\n interspex " ++ show sep ++ " " ++ show inp) False = undefined
interspersex _ [] = []
interspersex _ [x] = x
interspersex s (xs0 : xss) = xs0 ++ [s] ++ interspersex s xss

data Tree a
  = Node a (Tree a) (Tree a)
  | Empty
  deriving (Show)

unoa = Node "a" Empty Empty

unob = Node "b" Empty Empty

unoc = Node "c" Empty Empty

due = Node "due" unoa unob

tre = Node "tre" due unoc

height :: Tree a -> Integer
height Empty = 0
height (Node _ left right) = 1 + max (height left) (height right)

-- -- -- -- --

data Point = Point
  { x :: Double,
    y :: Double
  }
  deriving (Show)

data Direction = LeftDirection | StraightDirection | RightDirection deriving (Show)

getM :: Point -> Point -> Double
getM p1 p2 = (y p2 - y p1) / (x p2 - x p1)

getDirection :: Point -> Point -> Point -> Direction
getDirection p1 p2 p3
  | m2 < m1 = RightDirection
  | m2 == m1 = StraightDirection
  | m2 > m1 = LeftDirection
  where
    m1 = getM p1 p2
    m2 = getM p2 p3

p1 = Point {x = 1, y = 1}

p2 = Point {x = 2, y = 2}

p3a = Point {x = 3, y = 4}

p3b = Point {x = 3, y = 3}

p3c = Point {x = 3, y = 2}

getDirections :: [Point] -> [Direction]
getDirections [] = []
getDirections [a, b, c] = [getDirection a b c]
getDirections (a : b : c : xs) = getDirection a b c : getDirections (b : c : xs)

ranges :: [Point] -> (Double, Double, Double, Double)
ranges pts = (minl (xs pts), minl (ys pts), maxl (xs pts), maxl (ys pts))
  where
    xs :: [Point] -> [Double]
    xs [p] = [x p]
    xs (p : ps) = x p : xs ps

    ys :: [Point] -> [Double]
    ys [p] = [y p]
    ys (p : ps) = y p : ys ps

    minl :: [Double] -> Double
    minl [x] = x
    minl (x : xs) = min x (minl xs)

    maxl :: [Double] -> Double
    maxl [x] = x
    maxl (x : xs) = max x (maxl xs)

examplePoints :: [Point] =
  [ Point {x = 1, y = 1},
    Point {x = 2, y = 2},
    Point {x = 4, y = 4},
    Point {x = 4, y = 1},
    Point {x = 1, y = 4},
    Point {x = 3, y = 2},
    Point {x = 2, y = 3}
  ]

exampleRange :: (Integer, Integer, Integer, Integer) = (0, 0, 7, 7)

renderPoints :: (Integer, Integer, Integer, Integer) -> [Point] -> [String]
renderPoints (xmin, ymin, xmax, ymax) pts = [[if isTherePoint xk yk pts then '*' else ' ' | xk <- [xmin .. xmax]] | yk <- [ymin .. ymax]]
  where
    isTherePoint :: Integer -> Integer -> [Point] -> Bool
    isTherePoint _ _ [] = False
    isTherePoint xi yi ptz = or [(xi <= floor (x pt) && floor (x pt) < xi + 1) && (yi <= floor (y pt) && floor (y pt) < yi + 1) | pt <- pts]
