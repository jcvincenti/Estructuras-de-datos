
data Contenedor = Comida | Oxigeno | Torpedo | Combustible deriving (Show, Eq)

data Componente = Escudo | CanonLaser | Lanzatorpedos | Motor Int | Almacen [Contenedor] deriving (Show, Eq)

data Nave = Parte Componente Nave Nave | ParteBase deriving (Show, Eq)

data Tree a = EmptyT | NodeT a (Tree a) (Tree a) deriving (Show, Eq)

nave1 = Parte (Motor 5) (Parte Escudo (Parte Lanzatorpedos ParteBase ParteBase) ParteBase) (Parte CanonLaser (Parte (Almacen [Comida,Comida,Torpedo,Comida]) ParteBase ParteBase) ParteBase)
nave2 = Parte Escudo (Parte Lanzatorpedos ParteBase ParteBase) (Parte Lanzatorpedos ParteBase ParteBase)

componentes :: Nave -> [Componente]

componentes ParteBase = []
componentes (Parte componente naveIzq naveDer) = componente : componentes naveIzq ++ componentes naveDer

poderDePropulsion :: Nave -> Int
poderDePropulsion ParteBase = 0
poderDePropulsion (Parte (Motor a) naveIzq naveDer) = a + poderDePropulsion naveIzq + poderDePropulsion naveDer
poderDePropulsion (Parte componente naveIzq naveDer) = 0 + poderDePropulsion naveIzq + poderDePropulsion naveDer

desarmarse :: Nave -> Nave
desarmarse ParteBase = ParteBase
desarmarse (Parte componente naveIzq naveDer) = if ((componente == CanonLaser) || (componente == Lanzatorpedos)) then (Parte Escudo (desarmarse naveIzq) (desarmarse naveDer)) else (Parte componente (desarmarse naveIzq) (desarmarse naveDer))

cantidadDeComida :: Nave -> Int
cantidadDeComida ParteBase = 0
cantidadDeComida (Parte (Almacen a) naveIzq naveDer) = contarComidaEnAlmacen a + cantidadDeComida naveIzq + cantidadDeComida naveDer
cantidadDeComida (Parte componente naveIzq naveDer) = 0 + cantidadDeComida naveIzq + cantidadDeComida naveDer

contarComidaEnAlmacen :: [Contenedor] -> Int
contarComidaEnAlmacen [] = 0
contarComidaEnAlmacen (x:xs) = if x == Comida then 1 + contarComidaEnAlmacen xs else 0 + contarComidaEnAlmacen xs

naveToTree :: Nave -> Tree Componente
naveToTree ParteBase = EmptyT
naveToTree (Parte componente naveIzq naveDer) = NodeT componente (naveToTree naveIzq) (naveToTree naveDer)

aprovisionados :: [Contenedor] -> Nave -> Bool
aprovisionados provisiones ParteBase = True
aprovisionados provisiones (Parte (Almacen a) naveIzq naveDer) = chequearProvisionesEnAlmacen provisiones a
aprovisionados provisiones (Parte componente naveIzq naveDer) = True && aprovisionados provisiones naveIzq && aprovisionados provisiones naveDer

chequearProvisionesEnAlmacen :: [Contenedor] -> [Contenedor] -> Bool
chequearProvisionesEnAlmacen [] contenedor = True
chequearProvisionesEnAlmacen (x:xs) almacenLs = chequearProvisionEnAlmacen x almacenLs && chequearProvisionesEnAlmacen xs almacenLs

chequearProvisionEnAlmacen :: Contenedor -> [Contenedor] -> Bool
chequearProvisionEnAlmacen a [] = False
chequearProvisionEnAlmacen a (x:xs) = a == x || chequearProvisionEnAlmacen a xs

armasNivelN :: Int -> Nave -> [Componente]
armasNivelN a ParteBase = []
armasNivelN a (Parte componente naveDer naveIzq) = if a == 0 then [componente] else (armasNivelN (a-1) naveIzq) ++ (armasNivelN (a-1) naveDer)