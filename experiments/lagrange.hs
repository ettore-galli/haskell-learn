enumerate :: [a] -> [(Int, a)]
enumerate xs = enumerateFrom 0 xs
  where
    enumerateFrom :: Int -> [a] -> [(Int, a)]
    enumerateFrom _ [] = []
    enumerateFrom n (x : xs) = (n, x) : enumerateFrom (n + 1) xs

lagrangeBasis :: [(Float, Float)] -> Int -> Float -> Float
lagrangeBasis dps j x = foldl basisTerm 1.0 (enumerate dps)
  where
    basisTerm acc cur = if fst cur == j then acc else acc * (x - xm) / (xj - xm)
      where
        xm = fst (snd cur)
        xj = fst (dps !! j)

lagrange :: [(Float, Float)] -> Float -> Float
lagrange dps x = foldl (\acc dp -> acc + snd (snd dp) * lagrangeBasis dps (fst dp) x) 0 (enumerate dps)