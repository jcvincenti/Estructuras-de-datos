import Stack1

apilar :: [a] -> Stack a
apilar [] = emptyS
apilar (xs) = pushListToStack xs emptyS

pushListToStack :: [a] -> Stack a -> Stack a
pushListToStack [] s = s
pushListToStack xs s = pushListToStack (init xs) (push (last xs) s)

desapilar :: Stack a -> [a]
desapilar stack = pushStackToList stack []

pushStackToList :: Stack a -> [a] -> [a]
pushStackToList s xs = if isEmptyS s then xs else pushStackToList (pop s) (top s : xs)
