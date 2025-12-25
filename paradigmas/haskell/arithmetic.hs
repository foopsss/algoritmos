module Arithmetic where

-- Suma de dos números.
suma :: Integer -> Integer -> Integer
suma a b = a + b

-- Suma infija de dos números.
sumaInfija :: Integer -> Integer -> Integer
sumaInfija a b = (+) a b

-- Suma de Gauss: suma de una serie de números consecutivos.
sumaGauss :: Integer -> Integer
sumaGauss 0 = 0
sumaGauss n = n + sumaGauss(n - 1)

-- Resta de dos números.
resta :: Integer -> Integer -> Integer
resta a b = a - b

-- Producto de dos números.
producto :: Integer -> Integer -> Integer
producto a b = a * b

-- Producto de dos números en función de la suma.
productoSuma :: Integer -> Integer -> Integer
productoSuma a 0 = 0
productoSuma a 1 = a
productoSuma a b = a + productoSuma a (b - 1)

-- Divisón entera de dos números.
-- Considerar que para no tener que escribir operadores entre comillas traseras
-- es necesario escribir una operación en orden infijo (primero el operador y 
-- después los operandos).
divisionEntera1 :: Integer -> Integer -> Integer 
divisionEntera1 a b = a `div` b

divisionEntera2 :: Integer -> Integer -> Integer 
divisionEntera2 a b = div a b

-- Cociente de una división entera utilizando sumas y restas.
cocienteSuma :: Integer -> Integer -> Integer
cocienteSuma a b = 
    if a >= b
    then 1 + cocienteSuma (a - b) b
    else 0

-- Resto de una división entera utilizando restas.
restoResta :: Integer -> Integer -> Integer
restoResta a b =
    if a >= b
    then restoResta (a - b) b
    else a

-- Factorial de un número.
factorial :: Integer -> Integer
factorial 0 = 1
factorial a = a * factorial (a - 1)

-- Sumatoria de números entre i = 1 y N.
sumatoriaEntreUnoN :: Integer -> Integer
sumatoriaEntreUnoN 1 = 1
sumatoriaEntreUnoN n = n + sumatoriaEntreUnoN (n - 1)

-- Potencia en función del producto.
potenciaProducto :: Integer -> Integer -> Integer
potenciaProducto a 0 = 1
potenciaProducto a 1 = a
potenciaProducto a b = a * potenciaProducto a (b - 1)

-- Combinatorio de M, tomados de N en N.
-- Tener en cuenta: https://stackoverflow.com/questions/14656762
combinaciones1 :: Integer -> Integer -> Integer
combinaciones1 m n = (factorial m) `div` (factorial n * factorial (m - n))

combinaciones2 :: Integer -> Integer -> Integer
combinaciones2 m n = div (factorial m) (factorial n * factorial (m - n))

-- Sumatoria de i = 1 hasta N de: (3 * i) + 1.
primeraSumatoriaExpresion :: Integer -> Integer
primeraSumatoriaExpresion 1 = ((3 * 1) + 1)
primeraSumatoriaExpresion n = ((3 * n) + 1) + primeraSumatoriaExpresion (n - 1)

-- Sumatoria de i = 1 hasta N de: (3 * i) - 1.
segundaSumatoriaExpresion :: Integer -> Integer
segundaSumatoriaExpresion 1 = ((3 * 1) - 1)
segundaSumatoriaExpresion n = ((3 * n) - 1) + segundaSumatoriaExpresion (n - 1)

-- Obtener la representación binaria de un número dada su
-- representación decimal.
obtenerBinarioEnLista :: Integer -> [Integer]
obtenerBinarioEnLista num = reverse (
        if num >= 2
        then (restoResta num 2):obtenerBinarioEnLista (cocienteSuma num 2)
        else [num]
    )

decimalEnBinario :: Integer -> Integer
decimalEnBinario num = read (concat (map show (obtenerBinarioEnLista num)))

-- Función tal que, dado un par de enteros, devuelva el valor de verdad de la
-- relación de mayor estricto, utilizando solo comparaciones con el cero.
-- Definir rango y dominio de la función.
esMayorEstricto1 :: Integer -> Integer -> Bool
esMayorEstricto1 numA numB = (numA - numB > 0)

esMayorEstricto2 :: Integer -> Integer -> Bool
esMayorEstricto2 numA numB =
    if numA - numB > 0
    then True
    else False

-- Obtener el n-ésimo término de la sucesión de Fibonacci.
-- Se consideran las dos posibilidades: que la sucesión empiece con cero y con
-- uno.
fibonacciDesdeCero :: Integer -> Integer
fibonacciDesdeCero 1 = 0
fibonacciDesdeCero 2 = 1
fibonacciDesdeCero n = fibonacciDesdeCero (n - 1) + fibonacciDesdeCero (n - 2)

fibonacciDesdeUno :: Integer -> Integer
fibonacciDesdeUno 1 = 1
fibonacciDesdeUno 2 = 1
fibonacciDesdeUno n = fibonacciDesdeUno (n - 1) + fibonacciDesdeUno (n - 2)

-- Determinar si un número es primo.
esPrimo1 :: Integer -> Bool
esPrimo1 num = 
    if num >= 1
    then [x | x <- [2 .. (num - 1)], num `mod` x == 0] == []
    else False

esPrimo2 :: Integer -> Bool
esPrimo2 num = 
    if num >= 1
    then [x | x <- [2 .. (num - 1)], mod num x == 0] == []
    else False

-- Obtener todos los números primos entre uno y cien.
primosEntreUnoCien :: [Integer]
primosEntreUnoCien = [ x | x <- [1..100], esPrimo1 x]

-- Determinar el signo de un número.
signonum :: Integer -> Integer
signonum n
    | n == 0  = 0
    | n > 0   = 1
    | n < 0   = -1

-- Obtener la cantidad de números pares en una lista.
cantidadPares :: [Integer] -> Integer
cantidadPares [] = 0
cantidadPares (x:xs)
    | mod x 2 == 0  = 1 + cantidadPares xs
    | otherwise     = cantidadPares xs

-- Obtener una lista de salida con los números pares de una lista de entrada.
listaPares :: [Integer] -> [Integer]
listaPares [] = []
listaPares (x:xs)
    | mod x 2 == 0  = x:listaPares xs
    | otherwise     = listaPares xs

-- Determinar todos los puntos que estén ubicados sobre la recta de la
-- función identidad con dominio [0..10] e imagen [0..10].
estaSobreRectaIdentidad :: [(Integer, Integer)]
estaSobreRectaIdentidad = [ (x,y) | x <- [0..10], y <- [0..10], x == y]
