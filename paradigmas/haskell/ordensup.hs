module Ordensup where

-- Función de orden superior que aplique una función a todos los elementos
-- de una secuencia.
cuadrado :: Integer -> Integer
cuadrado num = num * num

cuadradoLista :: [Integer] -> [Integer]
cuadradoLista xs = map (cuadrado) xs

-- Función que, aplicada a un predicado (función booleana que dice si algo es
-- verdadero o falso) y una lista, produzca la sublista formada por los
-- elementos de la lista para los que no se cumple el predicado dado.
-- Ejemplo de ejecución: «rechazar [[],[1],[],[15,3,5],[],[1],[5]] (not.null)».
-- Ejemplo de ejecución: «rechazar [1,6,8,3,9,5,0,1,2] esPar».
esPar :: Integer -> Bool
esPar num = mod num 2 == 0

rechazar :: [a] -> (a -> Bool) -> [a]
rechazar xs pred = filter (\x -> (pred) x) xs

-- Construir una función que tome una lista 'xs' y una condición 'f' y devuelva
-- (ys, zs), donde 'ys' corresponde a los elementos que cumplen la condición y 
-- 'zs' al resto de los elementos.
-- Ejemplo de ejecución: «divide [1,6,7,2,8,0,5,8,1,0,5,7,2] esPar».
divide :: [a] -> (a -> Bool) -> ([a], [a])
divide xs cond = (
        rechazar xs cond,
        rechazar xs (not.cond)
    )

-- Calcular el factorial de un número utilizando un plegador por izquierda.
factorial :: Integer -> Integer
factorial num = foldl (*) 1 [1..num]
