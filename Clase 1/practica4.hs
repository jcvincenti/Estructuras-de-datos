data Set a = S [a] deriving (Show, Eq)

lista1 = S [1,2,3,4]
lista2 = S [5,6,7,8]
lista3 = S [2,4,6,8]

emptyS :: Set a
emptyS = S[]

addS :: Eq a => a -> Set a -> Set a
addS a (S xs) = S (a:xs)

belongs :: Eq a => a -> Set a -> Bool
belongs a (S xs) = elem a xs

sizeS :: Eq a => Set a -> Int
sizeS (S []) = 0
sizeS (S (x:xs)) = 1 + sizeS (S xs)

removeS :: Eq a => a -> Set a -> Set a
removeS a (S []) = S []
removeS a (S (x:xs)) = if (a == x) then removeS a (S xs) else addS x (removeS a (S xs))

unionS :: Eq a => Set a -> Set a -> Set a
unionS (S []) (S xy) = S xy
unionS (S xs) (S xy) = unionS (S (init xs)) (addS (last xs) (S xy))

intersectionS :: Eq a => Set a -> Set a -> Set a
intersectionS (S []) (S xs) = S []
intersectionS (S (x:xs)) (S xy) = if belongs x (S xy) then addS x (intersectionS (S xs) (S xy)) else intersectionS (S xs) (S xy)

-- Ejercicio 3 Queue

listaq1 = Q [1,2,3,4]
listaq2 = Q [5,6,7,8]
listaq3 = Q [2,4,6,8]

data Queue a = Q [a] deriving (Show, Eq)

emptyQ :: Queue a
emptyQ = Q []

isEmptyQ :: Queue a -> Bool
isEmptyQ (Q []) = True
isEmptyQ (Q [a]) = False

queue :: a -> Queue a -> Queue a
queue a (Q []) = Q [a]
queue a (Q (xs)) = Q (a:xs) 

firstQ :: Queue a -> a
firstQ (Q (a)) = last a

dequeue :: Queue a -> Queue a
dequeue (Q []) = Q []
dequeue (Q (a)) = Q (init a)