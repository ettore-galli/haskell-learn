module Cap3 where
  
myHead :: [a] -> a -> a
myHead [] fallback = fallback
myHead (x : xs) _ = x

compose :: (b -> c) -> (a -> b) -> (a -> c)
compose f1 f2 x = f1 (f2 x)

safeTail :: [a] -> [a]
safeTail [] = []
safeTail x = tail x

{-

-- file: ch04/Fold.hs
foldl :: (a -> b -> a) -> a -> [b] -> a

foldl step zero (x:xs) = foldl step (step zero x) xs
foldl _    zero []     = zero

-- file: ch04/Fold.hs
foldr :: (a -> b -> b) -> b -> [a] -> b

foldr step zero (x:xs) = step x (foldr step zero xs)
foldr _    zero []     = zero

-}

-- foldl (\a b-> "(" ++ a ++ "+" ++ b ++ ")") "0" ["1", "2", "3"]

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f x = foldl step [] x
  where
    step acc cur = if f cur then acc ++ [cur] else acc

myFilterr :: (a -> Bool) -> [a] -> [a]
myFilterr _ [] = []
myFilterr f x = foldr step [] x
  where
    step cur acc = if f cur then cur : acc else acc

appn :: [a] -> [a] -> [a]
appn xs ys = foldr (:) ys xs

fr :: (a -> b -> b) -> b -> [a] -> b
fr step zero (x : xs) = x `step` foldr step zero xs
fr _ zero [] = zero

fl :: (t -> a -> t) -> t -> [a] -> t
fl f z [] = z
fl f z (x : xs) =
  let z' = z `f` x
   in fl f z' xs

mytails :: [a] -> [[a]]
mytails [] = [[]]
mytails (x : xs) = (x : xs) : mytails xs

