'From Pharo8.0.0 of 22 January 2020 [Build information: Pharo-8.0.0+build.1124.sha.0932da82f08175e906b0e2a8052120c823374e9f (64 Bit)] on 10 November 2025 at 11:33:26.606854 pm'!
Object subclass: #Nodo
	instanceVariableNames: 'data ant prox'
	classVariableNames: ''
	package: 'Curso-Estructuras'!
!Nodo commentStamp: 'LucasIvanBenchatParra 11/3/2025 21:49' prior: 0!
"Nodo" es una clase que sirve para definir e interactuar con nodos,
como aquellos que se verían en una lista enlazada de lenguajes como
C o Pascal.

======================
Representación interna
======================
Clase compuesta por las siguientes variables de instancia:
* <<data>>: contiene el dato del nodo.
* <<ant>>: contiene el puntero al nodo anterior.
* <<prox>>: contiene el puntero al próximo nodo.

===========
API Pública
===========
La clase exporta los siguientes métodos para uso público:

	=======
	getters
	=======
	* <<data>>: método utilizado para acceder a los contenidos del nodo.
	* <<ant>>: método utilizado para acceder al nodo que antecede al nodo actual.
	* <<prox>>: método utilizado para acceder al nodo que le sigue al nodo actual.

	=======
	setters
	=======
	* <<data:>>: método utilizado para cargar información en un nodo.
	* <<ant:>>: método utilizado para definir el nodo que antecede al nodo actual.
	* <<prox:>>: método utilizado para definir el nodo que le sigue al nodo actual.!


!Nodo methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 11/3/2025 17:02'!
data
	"Método utilizado para devolver el
	contenido de un nodo."
	^data.! !

!Nodo methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 11/3/2025 17:10'!
prox
	"Método utilizado para devolver la
	próxima ubicación a la que apunta
	un nodo."
	^prox.! !

!Nodo methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 11/3/2025 17:10'!
ant
	"Método utilizado para devolver la
	ubicación anterior a la que apunta
	un nodo."
	^ant.! !


!Nodo methodsFor: 'printing' stamp: 'LucasIvanBenchatParra 11/3/2025 20:59'!
printOn: aStream
	"Redefinición de printOn utilizada para
	mostrar el contenido de un nodo. Primero
	muestra el contenido del nodo, y luego
	los valores de los nodos 'ant' y 'prim',
	si existen. En caso de no existir alguno
	de ellos se muestra 'nil'."
	| antContents proxContents |.
	antContents := nil.
	proxContents := nil.
	
	ant
		ifNil: [ antContents := antContents asString ]
		ifNotNil: [ antContents := (ant data) asString ].

	prox
		ifNil: [ proxContents := proxContents asString ]
		ifNotNil: [ proxContents := (prox data) asString ].
	
	aStream nextPutAll: '| dato = '.
	aStream nextPutAll: data asString.
	
	aStream nextPutAll: ' | ant = '.
	aStream nextPutAll: antContents.

	aStream nextPutAll: ' | prox = '.
	aStream nextPutAll: proxContents.
	
	aStream nextPutAll: ' |'.! !


!Nodo methodsFor: 'setting' stamp: 'LucasIvanBenchatParra 11/3/2025 18:39'!
ant: someElement
	"Método utilizado para enlazar un nodo
	con otro nodo. Solo permite recibir
	NIL u otro objeto de clase 'Nodo' como
	parámetro."
	(self isValidPointerValue: someElement) ifFalse: [
		^self error: 'Valores aceptados para "ant": NIL u otro objeto de clase <<Nodo>>.'.
	].
	
	ant := someElement.! !

!Nodo methodsFor: 'setting' stamp: 'LucasIvanBenchatParra 11/3/2025 17:04'!
data: someData
	"Método utilizado para cargarle datos
	a un nodo."
	data := someData.! !

!Nodo methodsFor: 'setting' stamp: 'LucasIvanBenchatParra 11/3/2025 18:39'!
prox: someElement
	"Método utilizado para enlazar un nodo
	con otro nodo. Solo permite recibir
	NIL u otro objeto de clase 'Nodo' como
	parámetro."
	(self isValidPointerValue: someElement) ifFalse: [
		^self error: 'Valores aceptados para "prox": NIL u otro objeto de clase <<Nodo>>.'.
	].

	prox := someElement.! !


!Nodo methodsFor: 'private' stamp: 'LucasIvanBenchatParra 11/3/2025 17:48'!
isValidPointerValue: someElement
	"
	Método privado para validar los valores
	que el usuario introduce en los atributos
	'ant' y 'prox' a través de sus setters.
	
	La idea es que los atributos que actúan
	como punteros solo puedan tener como
	valores posibles NIL o un objeto de
	esta misma clase.
	"
	((someElement isKindOf: self class) or: (someElement isNil)) ifFalse: [
		^false.
	].

	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Nodo class
	instanceVariableNames: ''!

!Nodo class methodsFor: 'instance creation' stamp: 'LucasIvanBenchatParra 11/3/2025 20:17'!
newNodeWithValue: value withPrevious: prevElem withNext: nextElem
	"Constructor usado para instanciar rápidamente
	un objeto de clase 'Nodo'."
	^self new
		data: value;
		ant: prevElem;
		prox: nextElem
		yourself.! !
