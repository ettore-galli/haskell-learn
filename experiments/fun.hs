hypotenuse :: (Floating a, RealFrac a, Integral b) => a -> a -> a -> b
hypotenuse a b c = floor (sqrt (a ^ 2 + b ^ 2 + c ^ 2))

closest :: (Floating a, Ord a) => a -> a -> a -> a
closest reference first second =
  let firstDistance = abs (first - reference)
      secondDistance = abs (second - reference)
   in if firstDistance < secondDistance
        then first
        else second

-- Example usage:
-- closest 3.14159265 3.14 (22/7)

(#) :: (Floating a) => a -> a -> a
(#) x y = (x / y) * pi / 180

(<#>) :: (Floating a) => a -> a -> a
(<#>) x y = x + y + 1

fct :: (Integral a) => a -> a
fct n
  | n < 2 = 1
  | otherwise = n * fct (n - 1)

sumOfOdds :: (Integral a) => a -> a
sumOfOdds n = runSum n 0
  where
    runSum n acc
      | n == 0 = acc
      | odd n = runSum (n - 1) (acc + n)
      | otherwise = runSum (n - 1) acc

buildNums :: (Ord t, Num t) => [t] -> t -> [t]
buildNums alls curr =
  if curr == 0
    then alls
    else buildNums (curr : alls) (curr - 1)

numbers :: (Integral a) => a -> [a]
numbers 0 = []
numbers n = buildNums [] n

deconstruct :: [a] -> a -> (a, [a])
deconstruct [] fallback = undefined
deconstruct [x] _ = (x, [])
deconstruct (x : xs) _ = (x, xs)

isele :: (Eq a) => a -> [a] -> Bool
isele _ [] = False
isele q (x : xs) = x == q || isele q xs

nub :: (Eq a) => [a] -> [a]
nub [] = []
nub [x] = [x]
nub li = qnub [] li
  where
    qnub res [] = res
    qnub r (x : xs) = qnub (if x `elem` r then r else x : r) xs

nub2 :: (Eq a) => [a] -> [a]
nub2 [] = []
nub2 [x] = [x]
nub2 (x : xs) = if x `elem` xs then nub xs else x : nub xs

nub3 :: (Eq a) => [a] -> [a]
nub3 [] = []
nub3 [x] = [x]
nub3 (x : xs)
  | x `elem` xs = nub xs
  | otherwise = x : nub xs

nub4 :: (Eq a) => [a] -> [a]
nub4 [] = []
nub4 [x] = [x]
nub4 (x : xs) = if x `elem` xs then nub4 xs else x : nub4 xs

revlist :: [a] -> [a]
revlist [] = []
revlist [x] = [x]
revlist (x : xs) = x : revlist xs

isAsc :: (Ord a) => [a] -> Bool
isAsc [] = True
isAsc [any] = True
isAsc [alfa, beta] = alfa <= beta
isAsc (first : (second : remaining)) = first <= second && isAsc (second : remaining)

getPath :: [(Int, Int)] -> Int -> Int -> [[Int]]
getPath [] _ _ = []
getPath graph start end
  | start == end = [[end]]
  | otherwise =
      [ start : path
        | (from, to) <- graph,
          from == start,
          path <- getPath graph to end
      ]

--   where
--     other = [(a, b) | (a, b) <- graph, a /= start]

example :: [(Int, Int)]
example = [(1, 2), (2, 3), (3, 2), (4, 3), (4, 5)]

(%%%) :: (a -> b) -> a -> b
(%%%) f a = f a

myfoldl :: (b -> a -> b) -> b -> [a] -> b
myfoldl _ acc [] = acc
myfoldl f acc (x : xs) = myfoldl f (f acc x) xs

-- myfoldl (\acc cur -> acc++[cur]) ["-"] ["a", "b", "c"]
-- ["-","a","b","c"]

myfoldr :: (a -> b -> b) -> b -> [a] -> b
myfoldr _ acc [] = acc
myfoldr f acc (x : xs) = f x (myfoldr f acc xs)

-- myfoldr (\cur acc -> acc ++ cur) "-" ["a", "b", "c"]
-- "-cba"

inverti :: (Ord a) => [a] -> [a]
inverti = foldl (\acc elem -> elem : acc) []

inverti' :: (Ord a) => [a] -> [a]
inverti' [] = []
inverti' [a] = [a]
inverti' [a, b] = [b, a]
inverti' (x : xs) = inverti' xs ++ [x]

inverti'' :: (Ord a) => [a] -> [a]
inverti'' xs = runinv [] xs
  where
    runinv buffer [] = buffer
    runinv buffer (x : xs) = runinv (x : buffer) xs

prefixes_ :: [a] -> ([a], [[a]])
prefixes_ [] = ([], [])
prefixes_ xs = foldl accprefix ([], []) xs
  where
    accprefix acc x =
      let (prefix, res) = acc
       in (x : prefix, prefix : snd acc)

doPrefixes1 :: [a] -> ([a], [[a]])
doPrefixes1 [] = ([], [])
doPrefixes1 xs = foldr accprefix ([], []) xs
  where
    accprefix x acc =
      let (p, res) = acc
          prefix = x : p
       in (prefix, prefix : snd acc)

doPrefixes :: [a] -> ([a], [[a]])
doPrefixes [] = ([], [])
doPrefixes xs = foldl accprefix ([], []) xs
  where
    accprefix acc x =
      let (p, res) = acc
          prefix = p ++ [x]
       in (prefix, prefix : snd acc)

prefixes :: [a] -> [[a]]
prefixes list = foldl (\acc x -> x : acc) [] (snd $ doPrefixes list)