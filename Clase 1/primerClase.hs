f :: Int -> Int
f x = x + 1

g :: Int -> Int -> Int
g x y = x * y + y

h :: Bool -> Int -> Int -> Bool
h b x y = b && x < y
--------------------------------------------------
{-
segundosEnTotal :: Int -> Int -> Int -> Int -> Int
segundosEnTotal d h m s = segundosEnDias d
						+ segundosEnHoras h
						+ segundosEnMinutos m
						+ s

segundosEnDias :: Int -> Int
segundosEnDias d = 
-}
-------------------------------------------------
-- comentarios de una sola linea
{-
	comentarios en
	varias lineas
-}

minimo :: Int -> Int -> Int
minimo a b = if a < b then a else b
-----------------------------------------------
minimo3 :: Int -> Int -> Int -> Int

{-
	minimo3 a b c = if minimo a b < c then minimo a b else c
-}

minimo3 a b c = minimo a (minimo b c);

-----------------------------------------------
--Conceptos basicos
sucesor :: Int -> Int
sucesor a = a + 1

sumar :: Int -> Int -> Int
sumar a b = a + b

maximo :: Int -> Int -> Int
maximo a b = if a > b then a else b

negar :: Bool -> Bool
negar True = False
negar False = True

andLogico :: Bool -> Bool -> Bool
andLogico True True = True
andLogico _ _ = False

orLogico :: Bool -> Bool -> Bool
orLogico True a = True
orLogico b True = True
orLogico c d = False

primera :: (Int,Int) -> Int
primera a = fst a
primera (a,b) = a

segunda :: (Int,Int) -> Int
segunda a = snd a
segunda (a,b) = b

sumaPar :: (Int,Int) -> Int
sumaPar (a,b) = a + b
sumaPar tupla = fst tupla + snd tupla

maxDelPar :: (Int,Int) -> Int
maxDelPar (a,b) = maximo a b

-- loMismo :: a -> a
loMismo a = a

-- siempreSiete :: a -> Int
siempreSiete a = 7

-- Ejercicio en pp

-- w :: (a,(b,c)) -> ((a,b),c)

w a = ((fst a, fst (snd a)),snd (snd a))
-- w (a,(b,c)) = ((a,b),c)

-- duplicar :: a -> (a,a)
duplicar a = (a,a)

-- singleton :: a -> [a]
singleton a = [a]

----------------------------------------

-- isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty xs = False


-- head' [a] -> a
head' (x:xs) = x

-- tail' [a] -> [a]
tail' (x:xs) = xs

---------------------------------------
-- Recursion --

-- sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria xs = head xs + sumatoria (tail xs)

-- longitud :: [a] -> Int
longitud [] = 0
longitud xs = 1 + longitud (tail xs)

-- mapSucesor :: [Int] -> [Int]
mapSucesor [] = []
mapSucesor xs = sucesor (head xs) : mapSucesor (tail xs)

-- con pattern matching
mapSucesor' [] = []
mapSucesor' (x:xs) = (sucesor x) : (mapSucesor' xs) 

-- mapSumaPar :: [(Int,Int)] -> [Int]
mapSumaPar [] = []
mapSumaPar xs = sumaPar (head xs) : mapSumaPar (tail xs)

mapSumaPar' [] = []
mapSumaPar' (x:xs) = (sumaPar x) : (mapSumaPar' xs)

-- mapMaxDelPar :: [(Int,Int)] -> [Int]
mapMaxDelPar [] = []
mapMaxDelPar xs = maxDelPar (head xs) : mapMaxDelPar (tail xs)

mapMaxDelPar' [] = []
mapMaxDelPar' (x:xs) = (maxDelPar x) : (mapMaxDelPar' xs)

-- todoVerdad :: [Bool] -> Bool
todoVerdad [] = True
todoVerdad (x:xs) = x && (todoVerdad xs)

-- algunaVerdad :: [Bool] -> Bool
algunaVerdad [] = False
algunaVerdad (x:xs) = x || (algunaVerdad xs)

-- pertenece :: a -> [a] -> Bool
pertenece a [] = False
pertenece a (x:xs) = a == x || pertenece a xs

-- apariciones :: a -> [a] -> Int
{-apariciones a [] = 0 
apariciones a (x:xs) = if (a == x) then (1 + (apariciones xs)) else (0 + (apariciones xs))
-}

-- filtrarMenoresA :: Int -> [Int] -> [Int]
filtrarMenoresA a [] = []
filtrarMenoresA a (x:xs) = if a > x then x: filtrarMenoresA a xs else filtrarMenoresA a xs

-- filtrarElemento :: a -> [a] -> [a]
filtrarElemento a [] = []
filtrarElemento a (x:xs) = if a /= x then x: filtrarElemento a xs else filtrarElemento a xs

-- mapLongitudes :: [[a]] -> [Int]
mapLongitudes [] = []
mapLongitudes (x:xs) = longitud x : mapLongitudes xs

-- longitudMayorA :: Int -> [[a]] -> [[a]]
longitudMayorA a [] = []
longitudMayorA a (x:xs) = if a < longitud x then longitud x : longitudMayorA a xs else longitudMayorA a xs

-- intercalar :: a -> [a] -> [a]
intercalar a [] = []
intercalar a [b] = [b]
intercalar a (x:xs) = x : (a : intercalar a xs)

-- snoc :: [a] -> a -> [a]
snoc [] a = [a]
snoc (x:xs) a = x: snoc xs a

-- append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys

-- aplanar :: [[a]] -> [a]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

-- reversa :: [a] -> [a]
reversa [a] = [a]
reversa (x:xs) = last xs : reversa (x:init xs)

-- zipMaximos :: [Int] -> [Int] -> [Int]
zipMaximos [] ys = []
zipMaximos xs [] = []
zipMaximos (x:xs) (y:ys) = maximo x y : zipMaximos xs ys

-- zipSort :: [Int] -> [Int] -> [(Int,Int)]
zipSort [] [] = []
zipSort (x:xs) (y:ys) = (minimo x y,maximo x y) : zipSort xs ys

-- promedio :: [Int] -> Int
promedio [] = 0
promedio xs = div (sum xs) (longitud xs)

-- minimum :: [a] -> a
minimum' [] = 0
minimum' (x:xs) = if x > head xs then minimum (head xs:tail xs) else minimum (x:tail xs)

-- factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- cuentaRegresiva :: Int -> [Int]
cuentaRegresiva 0 = []
cuentaRegresiva n = n : [cuentaRegresiva n-1]