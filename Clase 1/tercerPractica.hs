
data Tree a = EmptyT | NodeT a (Tree a) (Tree a) deriving (Show, Eq)

arbol1 = NodeT 2 EmptyT (NodeT 4 EmptyT EmptyT)
arbol2 = NodeT "hola" (NodeT "pepepe" (NodeT "blabla" EmptyT EmptyT) EmptyT) (NodeT "chau" EmptyT (NodeT "papa" (NodeT "asd" EmptyT EmptyT) EmptyT))
arbol3 = NodeT [2] (NodeT [6] (NodeT [8] EmptyT EmptyT) EmptyT) (NodeT [4] EmptyT EmptyT)

sumarT :: Tree Integer -> Integer
sumarT EmptyT = 0
sumarT (NodeT a b c) = a + sumarT b + sumarT c

sizeT :: Tree a -> Int
sizeT EmptyT = 0
sizeT (NodeT a b c) = 1 + sizeT b + sizeT c

mapDobleT :: Tree Integer -> Tree Integer
mapDobleT EmptyT = EmptyT
mapDobleT (NodeT a b c) = NodeT (a*2) (mapDobleT b) (mapDobleT c)

mapLongitudT :: Tree String -> Tree Int
mapLongitudT EmptyT = EmptyT
mapLongitudT (NodeT a b c) = NodeT (length a) (mapLongitudT b) (mapLongitudT c)

perteneceT :: Eq a => a -> Tree a -> Bool
perteneceT y EmptyT = False
perteneceT y (NodeT a b c) = (y == a) || perteneceT y b || perteneceT y c

aparicionesT :: Eq a => a -> Tree a -> Int
aparicionesT a EmptyT = 0
aparicionesT a (NodeT b c d) = if b == a then 1 + (aparicionesT a c) + (aparicionesT a d) else 0 + (aparicionesT a c) + (aparicionesT a d)

countLeaves :: Tree a -> Int
countLeaves EmptyT = 0
countLeaves (NodeT a b c) = 1 + countLeaves b + countLeaves c

leaves :: Tree a -> [a]
leaves EmptyT = []
leaves (NodeT a b c) = a : leaves b ++ leaves c

heightT :: Tree a -> Int
heightT EmptyT = 0
heightT (NodeT a b c) = if ((1 + heightT b) > (1 + heightT c)) then 1 + heightT b else 1 + heightT c

countNotLeaves :: Eq a => Tree a -> Integer
countNotLeaves EmptyT = 0
countNotLeaves (NodeT a b c) = if (b==EmptyT) && (c==EmptyT) then 0 else 1 + (countNotLeaves b) + (countNotLeaves c)

mirrorT :: Tree a -> Tree a
mirrorT EmptyT = EmptyT
mirrorT (NodeT a b c) = NodeT a (mirrorT c) (mirrorT b)

listInOrder :: Tree a -> [a]
listInOrder EmptyT = []
listInOrder (NodeT a b c) = listInOrder b ++ [a] ++ listInOrder c

listPreOrder :: Tree a -> [a]
listPreOrder EmptyT = []
listPreOrder (NodeT a b c) = a : listPreOrder b ++ listPreOrder c

listPosOrder :: Tree a -> [a]
listPosOrder EmptyT = []
listPosOrder (NodeT a b c) = listPosOrder b ++ listPosOrder c ++ [a]

concatenarListasT :: Tree [a] -> [a]
concatenarListasT EmptyT = []
concatenarListasT (NodeT a b c) = concatenarListasT b ++ a ++ concatenarListasT c

levelN :: Int -> Tree a -> [a]
levelN a EmptyT = []
levelN a (NodeT b c d) = if a == 0 then [b] else levelN (a-1) c ++ levelN (a-1) d

listPerLevel :: Tree a -> [[a]]
listPerLevel EmptyT = []
listPerLevel (NodeT a b c) = 

elementosMismoLevel :: Int -> Tree a -> [a]
elementosMismoLevel EmptyT = []
elementosMismoLevel a (NodeT b c d) = 