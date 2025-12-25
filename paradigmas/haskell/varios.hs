module Varios where

-- Verificar si un número es cero.
esCero :: Integer -> Bool
esCero 0 = True
esCero _ = False

-- XOR lógico: comparar dos valores y...
-- * Si son iguales, devolver falso.
-- * Si son distintos, devolver verdadero.
-- * Se añadieron los constraints «Eq a» y «Ord a» a la definición de los
--   tipos de datos de las funciones para poder utilizar los operadores de
--   comparación, ya que la idea es utilizar estas funciones con listas que
--   tienen elementos comparables, como caracteres o enteros.
xorLogico1 :: Eq a => a -> a -> Bool
xorLogico1 a b = not (a == b)

xorLogico2 :: Eq a => a -> a -> Bool
xorLogico2 a b = (a /= b)

xorLogico3 :: Ord a => a -> a -> Bool
xorLogico3 a b = (a < b || a > b)

xorLogico4 :: Bool -> Bool -> Bool
xorLogico4 True True = False
xorLogico4 False False = False
xorLogico4 _ _ = True

-- Verificar si un número está dentro de un rango establecido por una cota
-- superior y una cota inferior.
inRange :: Integer -> Integer -> Integer -> Bool
inRange li ls num =
    if num >= li && num <= ls
    then True
    else False

-- Obtener el tercer elemento de una tupla de tres elementos.
getTupleThirdElement :: (a, a, a) -> a
getTupleThirdElement (_, _, c) = c

-- Definir una función que, usando listas por compresión, determine los
-- primeros "n" números perfectos (enteros que son iguales a la suma de sus
-- divisores). Por ejemplo, 6 es perfecto porque 1 + 2 + 3 = 6.
esPerfecto :: Integer -> Bool
esPerfecto num = foldl (+) 0 [x | x <- [1..(num - 1)], mod num x == 0] == num

primerosPerfectos :: a -> [Integer]
primerosPerfectos cant = take cant [x | x <- [1..], esPerfecto x]
