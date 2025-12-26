'From Pharo8.0.0 of 22 January 2020 [Build information: Pharo-8.0.0+build.1124.sha.0932da82f08175e906b0e2a8052120c823374e9f (64 Bit)] on 10 November 2025 at 11:32:04.184804 pm'!
Object subclass: #NumeroNatural
	instanceVariableNames: 'num'
	classVariableNames: ''
	package: 'Curso-Numeros'!
!NumeroNatural commentStamp: 'LucasIvanBenchatParra 10/20/2025 18:14' prior: 0!
"NumeroNatural" es una clase que sirve para definir e interactuar con números natural.
Recuérdese que los números naturales son todos aquellos mayores o iguales a cero y que no sean decimales.

======================
Representación interna
======================
Clase compuesta por las siguientes variables de instancia:
* num: <Object>

===========
API Pública
===========
La clase exporta los siguientes métodos para uso público:

	-------
	getters
	-------
	* <<num>>: utilizado para acceder al número natural.

	-------
	setters
	-------
	* <<num:>>: utilizado para asignarle un número a una instancia de la clase.
	
	-------------
	Constructores
	-------------
	* <<new:>>: utilizado para instanciar un objeto de la clase a partir de un número pasado por parámetro.
	
	-----------------------
	Operaciones aritméticas
	-----------------------
	* <<+>>: utilizado para sumar números naturales.
	* <<->>: utilizado para restar números naturales.
	* <<*>>: utilizado para multiplicar números naturales.
	* <<**>>: utilizado para realizar la potencia de un número natural a un exponente N, también natural.
	* <</>>: utilizado para realizar la división decimal de números naturales.
	* <<//>>: utilizado para realizar la división entera de números naturales.
	* <<\\>>: utilizado para obtener el resto de la división entera entre dos números naturales.
	* <<factorial>>: utilizado para realizar el factorial de un número natural.
	
	---------------------
	Operaciones de testeo
	---------------------
	* <<isOdd>>: utilizado para saber si un número es par.
	* <<isPrime>>: utilizado para saber si un número es primo.
	* <<isPerfect>>: utilizado para saber si un número es perfecto.
	* <<isFriendsWith:>>: utilizado para saber si dos números son amigos.!


!NumeroNatural methodsFor: 'arithmetic' stamp: 'LucasIvanBenchatParra 10/11/2025 17:34'!
+ unNatural
	"Método para sumar dos números naturales."
	^self num + unNatural num.! !

!NumeroNatural methodsFor: 'arithmetic' stamp: 'LucasIvanBenchatParra 10/12/2025 19:55'!
factorial
	"Método para realizar el factorial de"
	"una instancia de la clase NumeroNatural."
	| fact |.
	fact := 1.
	
	1 to: self num do: [ :i |
		fact := fact * i.
	].

	^fact.! !

!NumeroNatural methodsFor: 'arithmetic' stamp: 'LucasIvanBenchatParra 10/13/2025 12:57'!
\\ unNatural
	"Método para multiplicar dos números naturales."
	^self num \\ unNatural num.! !

!NumeroNatural methodsFor: 'arithmetic' stamp: 'LucasIvanBenchatParra 10/13/2025 12:54'!
- unNatural
	"Método para restar dos números naturales."
	^self num - unNatural num.! !

!NumeroNatural methodsFor: 'arithmetic' stamp: 'LucasIvanBenchatParra 10/13/2025 12:59'!
** unNatural
	"Método para realizar la potencia
	entre dos números naturales."
	^self num ** unNatural num.! !

!NumeroNatural methodsFor: 'arithmetic' stamp: 'LucasIvanBenchatParra 10/13/2025 12:58'!
/ unNatural
	"Método para realizar la división decimal
	de dos números naturales."
	^self num / unNatural num.! !

!NumeroNatural methodsFor: 'arithmetic' stamp: 'LucasIvanBenchatParra 10/13/2025 12:59'!
// unNatural
	"Método para realizar la división entera
	de dos números naturales."
	^self num // unNatural num.! !

!NumeroNatural methodsFor: 'arithmetic' stamp: 'LucasIvanBenchatParra 10/13/2025 12:56'!
* unNatural
	"Método para multiplicar dos números naturales."
	^self num * unNatural num.! !


!NumeroNatural methodsFor: 'testing' stamp: 'LucasIvanBenchatParra 10/13/2025 12:40'!
isPerfect
	"Método utilizado para determinar si
	un número es perfecto."
	| suma_div |.
	suma_div := self sumOfProperDivisors.
	^suma_div = self num.! !

!NumeroNatural methodsFor: 'testing' stamp: 'LucasIvanBenchatParra 10/16/2025 19:55'!
isPrime
	"Método para calcular si un número
	es primo."
	| resultado pos |.
	resultado := true.
	pos := 2.

	"El número 0 no es primo ni compuesto."
	(self num = 0) ifTrue: [
		^self error: 'El número 0 no es primo ni compuesto.'.
	].

	"Mientras no haya más divisores y
	no se haya iterado sobre todos los
	números posibles se debe seguir
	revisando."
	[resultado and: pos <= (self num - 1)] whileTrue: [
		(self num \\ pos = 0) ifTrue: [
			resultado := false.
		].
		pos := pos + 1.
	].

	^resultado.! !

!NumeroNatural methodsFor: 'testing' stamp: 'LucasIvanBenchatParra 10/13/2025 12:03'!
isOdd
	"Método para determinar si un número
	es par."
	| resultado |.
	resultado := true.

	(self num \\ 2 = 0) ifTrue: [
		resultado := false.
	].

	^resultado.! !

!NumeroNatural methodsFor: 'testing' stamp: 'LucasIvanBenchatParra 10/16/2025 20:07'!
isFriendsWith: otroNatural
	"Método para determinar si dos números
	son amigos. Esto implica que la suma de
	los divisores del número A es igual al
	número B, y viceversa."
	| suma_div_num suma_div_otro_num |.
	suma_div_num := self sumOfProperDivisors.
	suma_div_otro_num := otroNatural sumOfProperDivisors.
	^(suma_div_num = otroNatural num) and: (suma_div_otro_num = self num).! !


!NumeroNatural methodsFor: 'private' stamp: 'LucasIvanBenchatParra 10/13/2025 12:37'!
sumOfProperDivisors
	"Método privado para devolver la suma
	de todos los divisores enteros de un
	número natural, a excepción del propio
	número."
	| suma_div |.
	suma_div := 0.
	
	1 to: (self num - 1) do: [ :i |
		(self num \\ i = 0) ifTrue: [
			suma_div := suma_div + i.
		].
	].

	^suma_div.! !


!NumeroNatural methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/11/2025 17:29'!
num
	"Método para devolver el número natural contenido"
	"en una instancia de la clase 'NumeroNatural'."
	^num.! !


!NumeroNatural methodsFor: 'setting' stamp: 'LucasIvanBenchatParra 10/16/2025 19:44'!
num: numero
	"Método para asignar un número natural a una"
	"instancia de la clase 'NumeroNatural'."
	(numero isNumber not or: numero isNil) ifTrue: [
		self error: 'Por favor, introduzca un número y no letras o símbolos.'.
	].
		
	(numero < 0 or: numero isFloat) ifTrue: [
		self error: 'Por favor, introduzca un número entero mayor a 0.'.
	].

	num := numero.! !


!NumeroNatural methodsFor: 'initialization' stamp: 'LucasIvanBenchatParra 10/20/2025 18:29'!
initialize
	"Inicialización de los atributos de la clase
	con valores por defecto que sean lógicos."
	super initialize.
	num := 0.! !



!NumeroNatural methodsFor: 'printing' stamp: 'LucasIvanBenchatParra 10/16/2025 19:45'!
printOn: aStream
	"Sobreescritura del método printOn, específica
	de esta clase."
	"Se lo sobreescribe con la finalidad de mostrar
	el valor del atributo 'num' cuando se inspecciona
	un objeto de esta clase."
	aStream nextPutAll: self num asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

NumeroNatural class
	instanceVariableNames: ''!

!NumeroNatural class methodsFor: 'creating' stamp: 'LucasIvanBenchatParra 10/16/2025 22:35'!
new: otroNatural
	"Método para instanciar de forma rápida
	un objeto de clase NumeroNatural con uno
	valor pasado por parámetro."
	| nuevo |.
	nuevo := self new.
	nuevo num: otroNatural.
	^nuevo.! !
