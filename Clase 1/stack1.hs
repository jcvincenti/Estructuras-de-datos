module Stack1 (Stack,emptyS, isEmptyS, push, top, pop) where

data Stack a = S [a] deriving (Show,Eq)

stack2 = S [1,2,3,4]

emptyS :: Stack a
emptyS = S []

isEmptyS :: Stack a -> Bool
isEmptyS (S []) = True
isEmptyS (S [a]) = False

push :: a -> Stack a -> Stack a
push a (S[]) = S [a]
push a (S (xs)) = S (a:xs)

top :: Stack a -> a
top (S (x:xs)) = x

pop :: Stack a -> Stack a
pop (S []) = emptyS
pop (S (x:xs)) = S (xs)