-- opuesto :: Dir -> Dir

data Dir = Norte|Sur|Este|Oeste deriving (Show, Eq)
opuesto :: Dir -> Dir

opuesto Norte = Sur
opuesto	Sur = Norte
opuesto Este = Oeste
opuesto Oeste = Este

siguiente :: Dir -> Dir
siguiente Norte = Este
siguiente Este = Sur
siguiente Sur = Oeste
siguiente Oeste = Norte


data Persona = P String Int deriving (Show)

nombre :: Persona -> String
nombre (P nm ed) = nm

edad :: Persona -> Int
edad (P nm ed) = ed

crecer :: Persona -> Persona
crecer (P nm ed) = P nm (ed + 1)

cambioDeNombre :: String -> Persona -> Persona
cambioDeNombre nm' (P nm ed) = P nm' ed

esMenorQueLaOtra :: Persona -> Persona -> Bool
esMenorQueLaOtra' (P nm ed) (P nm' ed') = ed < ed'


a1 = P "Jorge" 32
a2 = P "Pepe" 33
a3 = P "Pepita" 25
a4 = P "Pedro" 18
a5 = [a1,a2,a3,a4]

esMenorQueLaOtra p1 p2 = edad p1 < edad p2

mayoresA :: Int -> [Persona] -> [Persona]
mayoresA a [] = []
mayoresA a (x:xs) = if edad x > a then x : mayoresA a xs else mayoresA a xs

promedioEdad :: [Persona] -> Int
promedioEdad [a] = edad a
-- Terminar --

elMasViejo :: [Persona] -> Persona
elMasViejo [a] = a 
elMasViejo (x:xs) = if edad x > edad (head xs) then elMasViejo (x : tail xs) else elMasViejo xs

-- Pokemon --

data TipoDePokemon = Agua | Fuego | Planta deriving (Show, Eq)

leGanaA :: TipoDePokemon -> TipoDePokemon
leGanaA Fuego = Agua
leGanaA Agua = Planta
leGanaA Planta = Fuego

data Pokemon = Pokemon TipoDePokemon Int deriving (Show)
data Entrenador = Entrenador String [Pokemon] deriving (Show)

pk1 = Pokemon Agua 50
pk2 = Pokemon Fuego 30
pk3 = Pokemon Planta 70

ent1 = Entrenador "Ash" [pk1, pk2, pk3]
ent2 = Entrenador "Brook" [pk2, pk3]

tipoPk :: Pokemon -> TipoDePokemon
tipoPk (Pokemon tipo energia) = tipo

listaPokes :: Entrenador -> [Pokemon]
listaPokes (Entrenador nombre listaPk) = listaPk 

leGanaAlToque :: Pokemon -> Pokemon -> Bool
leGanaAlToque a b = tipoPk a == leGanaA (tipoPk b)

capturarPokemon :: Pokemon -> Entrenador -> Entrenador
capturarPokemon a (Entrenador nombre listaPk) = (Entrenador nombre (listaPk ++ [a]))

cantidadDePokemons :: Entrenador -> Int
cantidadDePokemons a = length (listaPokes a)


esExperto :: Entrenador -> Bool
esExperto entrenador = unPokemonDeCadaTipo (listaPokes entrenador)

unPokemonDeCadaTipo :: [Pokemon] -> Bool
unPokemonDeCadaTipo listaPokemons = hayPokemonDeAgua listaPokemons && hayPokemonDeFuego listaPokemons && hayPokemonDePlanta listaPokemons

hayPokemonDePlanta :: [Pokemon] -> Bool
hayPokemonDePlanta [] = False
hayPokemonDePlanta (x:xs) = if tipoPk x == Planta then True else hayPokemonDePlanta xs

hayPokemonDeAgua :: [Pokemon] -> Bool
hayPokemonDeAgua [] = False
hayPokemonDeAgua (x:xs) = if tipoPk x == Agua then True else hayPokemonDeAgua xs

hayPokemonDeFuego :: [Pokemon] -> Bool
hayPokemonDeFuego [] = False
hayPokemonDeFuego (x:xs) = if tipoPk x == Fuego then True else hayPokemonDeFuego xs
-- Pizza --

data Pizza = Prepizza | Agregar Ingrediente Pizza deriving (Show, Eq)

data Ingrediente = Salsa | Queso | Jamon | AceitunasVerdes Int deriving (Show, Eq)

pizzaDeQ = Agregar Queso Prepizza
pizzaDeJyQ = Agregar Jamon (Agregar Queso Prepizza)
pizzaDeJ = Agregar Jamon Prepizza
pizzaDeJyA = Agregar Jamon (Agregar (AceitunasVerdes 8) Prepizza)
pizzaDeA = Agregar (AceitunasVerdes 2) Prepizza
pizzaDeJyJ = Agregar Jamon (Agregar Jamon Prepizza)

ingredientes :: Pizza -> [Ingrediente]
ingredientes Prepizza = []
ingredientes (Agregar ingrediente pizza) = ingrediente : (ingredientes pizza)

tieneJamon :: Pizza -> Bool
tieneJamon Prepizza = False
tieneJamon (Agregar ingrediente pizza) = if ingrediente == Jamon then True else tieneJamon pizza

sacarJamon :: Pizza -> Pizza
sacarJamon Prepizza = Prepizza
sacarJamon (Agregar ingrediente pizza) = if ingrediente /= Jamon then (Agregar ingrediente (sacarJamon pizza)) else sacarJamon pizza

armarPizza :: [Ingrediente] -> Pizza
armarPizza [] = Prepizza
armarPizza (x:xs) = Agregar x (armarPizza xs)


duplicarAceitunas :: Pizza -> Pizza
duplicarAceitunas Prepizza = Prepizza
duplicarAceitunas (Agregar (AceitunasVerdes a) pizza) = (Agregar (AceitunasVerdes (a*2)) (duplicarAceitunas pizza))
duplicarAceitunas (Agregar ingrediente pizza) = Agregar ingrediente (duplicarAceitunas pizza)

sacar :: [Ingrediente] -> Pizza ->  Pizza
sacar ingredienteLs Prepizza = Prepizza
sacar ingredienteLs (Agregar ingrediente pizza) = if  (seEncuentra ingredienteLs ingrediente) then sacar ingredienteLs pizza else (Agregar ingrediente (sacar ingredienteLs pizza))

seEncuentra :: [Ingrediente] -> Ingrediente -> Bool
seEncuentra [] ingrediente = False
seEncuentra (x:xs) ingrediente = if (x==ingrediente) then True else seEncuentra xs ingrediente

{-
cantJamon :: [Pizza] -> [(Int, Pizza)]
Dada una lista de pizzas devuelve un par donde la primera componente es la cantidad
de jamón de la pizza que es la segunda componente
-}

cantJamon :: [Pizza] -> [(Int, Pizza)]
cantJamon [] = []
cantJamon (x:xs) = if tieneJamon x then ((sumarJamon x, x) : cantJamon xs) else ((0,x) : cantJamon xs)

sumarJamon :: Pizza -> Int
sumarJamon Prepizza = 0
sumarJamon (Agregar ingrediente pizza) = if (ingrediente == Jamon) then (1 + sumarJamon pizza) else (0 + sumarJamon pizza)

{-
mayorNAceitunas :: Int -> [Pizza] -> [Pizza]
Devuelve las pizzas con más de “n” aceitunas.
-}

mayorNAceitunas :: Int -> [Pizza] -> [Pizza]
mayorNAceitunas a [] = []
mayorNAceitunas a (x:xs) = if (tieneMasAceitunas a x) then x : mayorNAceitunas a xs else mayorNAceitunas a xs

tieneMasAceitunas :: Int -> Pizza -> Bool
tieneMasAceitunas a Prepizza = False
tieneMasAceitunas a (Agregar (AceitunasVerdes b) pizza) = a < b 
tieneMasAceitunas a (Agregar ingrediente pizza) = tieneMasAceitunas a pizza


data Objeto = Cacharro | Tesoro deriving (Show, Eq)
data Camino = Fin | Cofre [Objeto] Camino | Nada Camino deriving (Show, Eq)

{-
hayTesoro :: Camino -> Bool
Indica si hay un cofre con un tesoro en el camino.
-}

caminoA = Nada (Nada (Cofre [Tesoro] Fin))
caminoB = Nada (Nada (Fin))
caminoC = Fin

hayTesoro :: Camino -> Bool
hayTesoro Fin = False
hayTesoro (Cofre [objeto] camino) = objeto == Tesoro || hayTesoro camino
hayTesoro (Nada camino) = hayTesoro camino


{-
pasosHastaTesoro :: Camino -> Int
Indica la cantidad de pasos que hay que recorrer hasta llegar al primer cofre con un
tesoro. Si un cofre con un tesoro está al principio del camino, la cantidad de pasos a
recorrer es 0.
-}


pasosHastaTesoro :: Camino -> Int

pasosHastaTesoro (Cofre objeto camino) = if elObjetoTieneUnTesoro objeto then 0 else 1 + (pasosHastaTesoro camino)
pasosHastaTesoro (Nada camino) = 1 + pasosHastaTesoro camino
pasosHastaTesoro Fin = 0

elObjetoTieneUnTesoro :: [Objeto] -> Bool
elObjetoTieneUnTesoro [] = False
elObjetoTieneUnTesoro (x:xs) = x == Tesoro || elObjetoTieneUnTesoro xs