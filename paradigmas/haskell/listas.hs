module Listas where

-- Obtener la longitud de una lista.
listLength1 :: [a] -> Integer
listLength1 list = case list of
    []     -> 0
    (_:xs) -> 1 + listLength1 xs

listLength2 :: [a] -> Integer
listLength2 list = case list of
    []  -> 0
    [a] -> 1
    xs  -> 1 + listLength2 (drop 1 xs)

listLength3 :: [a] -> Integer
listLength3 [] = 0
listLength3 list = case list of
    [a] -> 1
    xs -> 1 + listLength3 (drop 1 xs)

listLength4 :: [a] -> Integer
listLength4 [] = 0
listLength4 (x:xs) = 1 + listLength4 xs

listLength5 :: [a] -> Integer
listLength5 [] = 0
listLength5 (_:xs) = 1 + listLength5 xs

-- Obtener la cabeza de una lista.
listHead1 :: [a] -> a
listHead1 [] = error "Lista vacía"
listHead1 (x:xs) = x

listHead2 :: [a] -> a
listHead2 [] = error "Lista vacía"
listHead2 (x:_) = x

-- Obtener la cola de una lista.
listTail1 :: [a] -> a
listTail1 [] = error "Lista vacía"
listTail1 xs = case xs of
    [x] -> x
    xs  -> listTail1 (drop 1 xs)

-- listTail2 :: [a] -> a
-- listTail2 [] = error "Lista vacía"
-- listTail2 xs = (head.reverse) xs

-- Obtener los primeros N elementos de una lista.
retrieveAmount1 :: [a] -> Integer -> [a]
retrieveAmount1 [] _ = error "Lista vacía"
retrieveAmount1 (x:xs) a =
    if a >= 1
    then x:retrieveAmount1 xs (a - 1)
    else []

retrieveAmount2 :: [a] -> Integer -> [a]
retrieveAmount2 [] _ = error "Lista vacía"
retrieveAmount2 (x:xs) a =
    if a >= 1
    then x:retrieveAmount2 xs (a - 1)
    else []

retrieveAmount3 :: [a] -> Integer -> [a]
retrieveAmount3 [] _ = error "Lista vacía"
retrieveAmount3 xs 0 = []
retrieveAmount3 (x:xs) a = x:retrieveAmount3 xs (a - 1)

retrieveAmount4 :: [a] -> Integer -> [a]
retrieveAmount4 [] _ = error "Lista vacía"
retrieveAmount4 _ 0 = []
retrieveAmount4 (x:xs) a = x:retrieveAmount4 xs (a - 1)

-- Eliminar los primeros N elementos de una lista.
-- * Se añade la condición «nombre [] _ = []» para poder finalizar la ejecución
--   exitosamente cuando se llega al final de la lista.
dropAmount1 :: [a] -> Integer -> [a]
dropAmount1 [] _ = []
dropAmount1 xs 0 = xs
dropAmount1 (x:xs) a = dropAmount1 xs (a - 1)

dropAmount2 :: [a] -> Integer -> [a]
dropAmount2 [] _ = []
dropAmount2 xs 0 = xs
dropAmount2 (_:xs) a = dropAmount2 xs (a - 1)

-- Remover todas las ocurrencias de un elemento determinado de una lista.
-- * Se añadió el constraint «Eq a» a la definición de los tipos de datos de
--   las funciones para poder utilizar los operadores de comparación, ya que
--   la idea es utilizar estas funciones con listas que tienen elementos
--   comparables, como caracteres o enteros.
-- * Se añade la condición «nombre [] _ = []» para poder finalizar la ejecución
--   exitosamente cuando se llega al final de la lista.
takeElementOutList1 :: Eq a => [a] -> a -> [a]
takeElementOutList1 [] _ = []
takeElementOutList1 (x:xs) a
    | x == a     = takeElementOutList1 xs a
    | otherwise  = x:takeElementOutList1 xs a

takeElementOutList2 :: Eq a => [a] -> a -> [a]
takeElementOutList2 [] _ = []
takeElementOutList2 (x:xs) a
    | x /= a     = x:takeElementOutList2 xs a
    | otherwise  = takeElementOutList2 xs a

-- Reemplazar todos los elementos de una lista con asteriscos.
replaceElementsWithAsterisks :: [a] -> String
replaceElementsWithAsterisks [] = []
replaceElementsWithAsterisks xs = '*':replaceElementsWithAsterisks (drop 1 xs)

-- Obtener el n-ésimo carácter de una cadena/string.
-- No olvidar que una cadena también es una lista, así que se lo puede
-- generalizar.
obtenerElementoLista :: [a] -> Integer -> a
obtenerElementoLista (x:xs) pos
    | pos == 1  = x
    | otherwise = obtenerElementoLista xs (pos - 1)

-- Sumar todos los números menores a tres que aparezcan en una lista de enteros
-- utilizando guardas.
sumaMenoresTres :: [Integer] -> Integer
sumaMenoresTres [] = 0
sumaMenoresTres (x:xs)
    | x < 3     = x + sumaMenoresTres xs
    | otherwise = sumaMenoresTres xs

-- Mostrar si el n-ésimo elemento de una lista ingresada es par.
mostrarSiElementoPar :: [Integer] -> Integer -> Bool
mostrarSiElementoPar list pos
    | mod (obtenerElementoLista list pos) 2 == 0 = True
    | otherwise                                  = False

-- Devolver los últimos n-1 caracteres de una cadena.
-- No olvidar que una cadena también es una lista, así que se lo puede
-- generalizar.
-- * Se añadió el prefijo "fromIntegral" a "(listLength1 xs)" y "cant" para que
--   sean del mismo tipo, porque de lo contrario se obtiene el siguiente mensaje
--   de error: "Couldn't match expected type 'Int' with actual type 'Integer'."
lastAmountElementsSansOne :: [a] -> Integer -> [a]
lastAmountElementsSansOne [] _ = error "Lista vacía"
lastAmountElementsSansOne xs 0 = xs
lastAmountElementsSansOne xs cant = drop (
        fromIntegral (listLength1 xs) - fromIntegral cant + 1
    ) xs

-- Concatenar un carácter a una cadena.
concatenar :: String -> String -> String
concatenar a b = a ++ b

-- Añadir una nueva cola a una lista.
aniadirColaLista1 :: [a] -> a -> [a]
aniadirColaLista1 xs elem = xs ++ [elem]

aniadirColaLista2 :: [a] -> a -> [a]
aniadirColaLista2 xs elem = reverse(
        elem:reverse (xs)
    )

-- Invertir el orden de los elementos de una lista.
invertir :: [a] -> [a]
invertir [] = []
invertir (x:xs) = aniadirColaLista1 (invertir xs) x

-- Devolver la cantidad de "a" en una cadena usando guardas.
-- Se lo puede generalizar para buscar cualquier letra.
-- * Se la debe llamar con el siguiente formato de parámetros:
--   "string" 'carácter'.
cantidadLetraEnCadena :: String -> Char -> Integer
cantidadLetraEnCadena [] _ = 0
cantidadLetraEnCadena (x:xs) letra
    | x == letra = 1 + cantidadLetraEnCadena xs letra
    | otherwise  = cantidadLetraEnCadena xs letra
