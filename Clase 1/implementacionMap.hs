import Map1

buscarClaves :: Eq k => [k] -> Map k v -> [Maybe v]
buscarClaves [] map = []
buscarClaves (x:xs) map = lookupM map x : buscarClaves xs map

estanTodas :: Eq k => [k] -> Map k v -> Bool
estanTodas [] map = True
estanTodas (x:xs) map = elem x (domM map) && estanTodas xs map

actualizarClaves :: Eq k => [(k, v)] -> Map k v -> Map k v