
type Software = String

data Autor = Admin String | Dev String deriving (Show, Eq)

data Organizador = Agregar Software [Autor] Organizador | Vacio deriving (Show, Eq)

organizador1 = (Agregar "soft1" [(Admin "pepe"), (Admin "pepe")] (Agregar "soft2" [(Admin "juan")] Vacio))

-- Propósito: dado un organizador, denota el conjunto de pares programa y cantidad de autores que existen.
pares :: Organizador -> [(Software, Int)]
pares Vacio = []
pares (Agregar soft autoresLs org) = (soft, cantidadAutores autoresLs) : pares org

cantidadAutores :: [Autor] -> Int
cantidadAutores [] = 0
cantidadAutores (x:xs) = 1 + cantidadAutores xs

enComun :: Autor -> Autor -> Organizador -> [Software]
enComun autor1 autor2 Vacio = []
enComun autor1 autor2 (Agregar software autoresLs org) = if ((perteneceA autor1 autoresLs) && (perteneceA autor2 autoresLs)) then software : enComun autor1 autor2 org else enComun autor1 autor2 org

perteneceA :: Autor -> [Autor] -> Bool
perteneceA autor [] = False
perteneceA autor (x:xs) = (autor == x) || perteneceA autor xs

filtrar :: [Autor] -> Organizador -> Organizador
filtrar autor Vacio = Vacio
filtrar autores (Agregar software autoresLs org) = Agregar software (eliminarAutores autores autoresLs) (filtrar autores org)

eliminarAutores :: [Autor] -> [Autor] -> [Autor]
eliminarAutores autoresAEliminar [] = []
eliminarAutores autoresAEliminar (y:ys) = if perteneceA y autoresAEliminar then eliminarAutores autoresAEliminar ys else y : (eliminarAutores autoresAEliminar ys)

losAdmin :: Organizador -> [Autor]
losAdmin Vacio = []
losAdmin (Agregar soft autoresLs org) = if tengoAdmin autoresLs then sinRepetidos (agregarAdmin autoresLs) ++ losAdmin org else losAdmin org

agregarAdmin :: [Autor] -> [Autor]
agregarAdmin [] = []
agregarAdmin (x:xs) = if esAdmin x then x : agregarAdmin xs else agregarAdmin xs

tengoAdmin :: [Autor] -> Bool
tengoAdmin [] = False
tengoAdmin (x:xs) = esAdmin x || tengoAdmin xs 

esAdmin :: Autor -> Bool
esAdmin (Admin _) = True
esAdmin (Dev _) = False

sinRepetidos :: [Autor] -> [Autor]
sinRepetidos [] = []
sinRepetidos (x:xs) = if perteneceA x xs then (sinRepetidos xs) else (x : sinRepetidos xs)

{-
ordenar :: [Software] -> [Software]
ordenar [] = []
ordenar ls = -}