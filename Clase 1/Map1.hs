module Map1 (Map, emptyM, assocM, lookupM, deleteM, domM) where

data Map k v = M [(k,v)] deriving (Show, Eq)

map2 = M [(1,2),(3,4), (5,6), (7,8)]

emptyM :: Map k v
emptyM = M []

assocM :: Eq k => Map k v -> k -> v -> Map k v
assocM (M xs) k v = M ((k,v) : xs)

lookupM :: Eq k => Map k v -> k -> Maybe v
lookupM (M []) k' = Nothing
lookupM (M (x:xs)) k' = if (fst x) == k' then Just (snd x) else (lookupM (M xs) k')

deleteM :: Eq k => Map k v -> k -> Map k v
deleteM (M []) k = emptyM
deleteM (M (x:xs)) k = if fst x == k then M xs else assocM (deleteM (M xs) k) (fst x) (snd x)

domM :: Map k v -> [k]
domM (M []) = []
domM (M (x:xs)) = fst x : domM (M xs)