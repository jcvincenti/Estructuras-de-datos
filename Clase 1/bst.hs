

data Tree a = EmptyT | NodeT a (Tree a) (Tree a) deriving (Show, Eq)

arbol1 = NodeT 8 
				(NodeT 3 
					(NodeT 1 
						EmptyT 
						(NodeT 2 EmptyT EmptyT)) 
					(NodeT 6 
						(NodeT 4 EmptyT EmptyT) 
						(NodeT 7 EmptyT EmptyT))) 
				(NodeT 10 
					EmptyT 
					(NodeT 14 
						(NodeT 13 EmptyT EmptyT) 
						EmptyT))

perteneceBST :: Ord a => a -> Tree a -> Bool
perteneceBST a EmptyT = False
perteneceBST a (NodeT b ti td) = (a == b) || 
	if a < b 
		then perteneceBST a ti 
		else perteneceBST a td

insertBST :: Ord a => a -> Tree a -> Tree a
insertBST a EmptyT = NodeT a EmptyT EmptyT
insertBST a (NodeT b ti td) = if a < b 
								then NodeT b (insertBST a ti) td
								else NodeT b ti (insertBST a td)

minBST :: Ord a => Tree a -> a
minBST (NodeT a EmptyT _) = a
minBST (NodeT a ti td) = minBST ti

deleteMinBST :: Ord a => Tree a -> Tree a
deleteMinBST (NodeT a EmptyT td) = td
deleteMinBST (NodeT a ti td) = NodeT a (deleteMinBST ti) td

maxBST :: Ord a => Tree a -> a
maxBST (NodeT a _ EmptyT) = a
maxBST (NodeT a ti td) = maxBST td

deleteMaxBST :: Ord a => Tree a -> Tree a
deleteMaxBST (NodeT a ti EmptyT) = ti
deleteMaxBST (NodeT a ti td) = NodeT a ti (deleteMaxBST td)

deleteBST :: Ord a => a -> Tree a -> Tree a
deleteBST a EmptyT = EmptyT
deleteBST a (NodeT b ti td) = if ((isEmptyBST ti) && (isEmptyBST td)) 
								then EmptyT
								else if isEmptyBST ti
									then td
									else if isEmptyBST td
										then ti
										else 