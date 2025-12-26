'From Pharo8.0.0 of 22 January 2020 [Build information: Pharo-8.0.0+build.1124.sha.0932da82f08175e906b0e2a8052120c823374e9f (64 Bit)] on 10 November 2025 at 11:33:20.201959 pm'!
Object subclass: #ListaDoble
	instanceVariableNames: 'size prim ult'
	classVariableNames: ''
	package: 'Curso-Estructuras'!
!ListaDoble commentStamp: 'LucasIvanBenchatParra 11/4/2025 17:50' prior: 0!
"ListaDoble" es una clase que sirve para definir e interactuar con
estructuras parecidas a las listas doblemente enlazadas que se ven
en lenguajes como C o Pascal.

Esta clase trabaja con objetos de clase <<Nodo>>, los cuales se
utilizan para armar una lista.

======================
Representación interna
======================
Clase compuesta por las siguientes variables de instancia:
* <<size>>: contiene el tamaño de la lista.
* <<prim>>: contiene el primer nodo de la lista.
* <<ult>>: contiene el último nodo de la lista.

===========
API Pública
===========
La clase exporta los siguientes métodos para uso público:

	=======
	getters
	=======
	* <<size>>: método utilizado para obtener el tamaño de una lista doble.
	* <<prim>>: método utilizado para obtener el primer elemento de una lista doble.
	* <<ult>>: método utilizado para obtener el último elemento de una lista doble.

	====================================
	Operaciones de creación de instancia
	====================================
	* <<initializeListWithFirstElement:>>: método utilizado para inicializar una
	  instancia de esta clase con un primer elemento.

	=============
	Constructores
	=============
	* <<newListWithFirstElement:>>: método constructor utilizado para instanciar
	  rápidamente un objeto de esta clase con un primer elemento.

	=====================
	Operaciones de acceso
	=====================
	* <<nodeAt:>>: método utilizado para devolver el nodo de una posición determinada
	  de una lista.
	* <<nodeValueAt:>>: método utilizado para devolver el dato de un nodo en una
	  posición determinada de una lista.
	
	======================
	Operaciones de control
	======================
	* <<isEmpty>>: método utilizado para verificar si la lista está vacía.

	=====================================
	Operaciones de manipulación de listas
	=====================================
	* <<addNewHeadWithValue:>>: método utilizado para añadirle una nueva cabeza a la
	  lista. La cabeza sería el nuevo "prim".
	* <<addNewTailWithValue:>>: método utilizado para añadirle una nueva cola a la
	  lista. La cola sería el nuevo "ult".
	* <<addNewElementWithValue:atPosition:>>: método utilizado para añadir nuevos
	  elementos a la lista en posiciones intermedias.
	* <<removeHead>>: método utilizado para remover la cabeza de la lista, la cual
	  sería "prim".
	* <<removeTail>>: método utilizado para remover la cola de la lista, la cual
	  sería "ult".
	* <<removeElementWithValue:>>: método utilizado para remover un elemento de
	  la lista que tenga un valor determinado. Solo remueve la primera ocurrencia
	  del valor introducido.
	* <<removeAllElementsWithValue:>>: método utilizado para remover todos los
	  elementos de la lista que tengan un valor determinado.

	========================
	Operaciones de recorrido
	========================
	* <<listDo:>>: método equivalente al "do:" utilizado para recorrer otras
	  colecciones.
	* <<listReverseDo:>>: método equivalente al "do:" utilizado para recorrer
	  otras colecciones, con la diferencia de que este empieza a recorrer desde
	  el final de la lista.
	* <<listCollect:>>: método equivalente al "collect:" utilizado para recorrer
	  otras colecciones y realizar operaciones de manera uniforme sobre todos
	  sus elementos.
	  ** Este método devuelve como resultado otra lista, la cual va a contener
	     todos los objetos modificados.
	* <<listSelect:>>: método equivalente al "select:" utilizado para recorrer
	  otras colecciones y devolver aquellos elementos que cumplan una condición
	  determinada.
	  ** Este método devuelve como resultado otra lista, la cual va a contener
	     todos los objetos que cumplan con la condición establecida.
	* <<listReject:>>: método equivalente al "reject:" utilizado para recorrer
	  otras colecciones y devolver aquellos elementos que NO cumplan una
	  condición determinada.
	  ** Este método devuelve como resultado otra lista, la cual va a contener
	     todos los objetos que NO cumplan con la condición establecida.!


!ListaDoble methodsFor: 'initialization' stamp: 'LucasIvanBenchatParra 11/3/2025 17:55'!
initialize
	"
	Inicialización de los atributos de la clase
	con valores por defecto que sean lógicos.
	
	Los atributos 'prim' y 'ult' ya son inicializados
	con NIL automáticamente, por lo que no se lo
	hace en este método para evitar advertencias
	innecesarias.
	"
	super initialize.
	size := 0.! !


!ListaDoble methodsFor: 'printing' stamp: 'LucasIvanBenchatParra 11/4/2025 10:53'!
printOn: aStream
	"
	Redefinición de printOn utilizada para
	mostrar el contenido de una lista.
	
	Muestra todos los contenidos de la lista
	en sucesión y pone un 'nil' al final cuando
	ya no quedan elementos.
	"
	
	"Lista vacía."
	(size = 0) ifTrue: [
		^aStream nextPutAll: '{ nil }'.
	].
	
	"Lista con uno o más nodos."
	aStream nextPutAll: '{ '.
	
	self listDo: [ :each |
		(each data)
			ifNil: [ aStream nextPutAll: nil asString ]
			ifNotNil: [ aStream nextPutAll: (each data) asString ].
		
		(each == ult) ifFalse: [
			aStream nextPutAll: ' --> '.
		].
	].
	
	aStream nextPutAll: ' --> nil'.
	aStream nextPutAll: ' }'.! !


!ListaDoble methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 11/3/2025 18:00'!
size
	"Método utilizado para obtener
	el tamaño de una lista doble."
	^size.! !

!ListaDoble methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 11/3/2025 18:00'!
ult
	"Método utilizado para devolver
	el último elemento de una lista
	doble."
	^ult.! !

!ListaDoble methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 11/4/2025 15:04'!
nodeValueAt: aPosition
	"Método utilizado para recuperar un
	elemento de una posición dada de una
	lista."
	| positionNumber |.
	(aPosition <= 0 or: aPosition > size) ifTrue: [
		^self error: 'Introduzca una posición válida dentro de la lista'.
	].

	positionNumber := 1.
	
	self listDo: [ :each |
		(positionNumber = aPosition) ifTrue: [
			^each data.
		].
		positionNumber := positionNumber + 1.
	].

	^nil.! !

!ListaDoble methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 11/3/2025 18:00'!
prim
	"Método utilizado para devolver
	el primer elemento de una lista
	doble."
	^prim.! !

!ListaDoble methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 11/4/2025 15:04'!
nodeAt: aPosition
	"Método utilizado para recuperar un
	elemento de una posición dada de una
	lista."
	| positionNumber |.
	(aPosition <= 0 or: aPosition > size) ifTrue: [
		^self error: 'Introduzca una posición válida dentro de la lista'.
	].

	positionNumber := 1.
	
	self listDo: [ :each |
		(positionNumber = aPosition) ifTrue: [
			^each.
		].
		positionNumber := positionNumber + 1.
	].

	^nil.! !


!ListaDoble methodsFor: 'adding' stamp: 'LucasIvanBenchatParra 11/3/2025 20:21'!
addNewTailWithValue: someValue
	"Método utilizado para añadir un nuevo ult
	a la lista doble."
	| newUlt |
	
	(size = 0) ifTrue: [
		"Si la lista está vacía, corresponde
		inicializarla con el valor recibido
		acá."
		^self initializeListWithFirstElement: someValue.
	].

	newUlt := Nodo newNodeWithValue: someValue withPrevious: ult withNext: nil.
	
	ult prox: newUlt.
	ult := newUlt.
	
	size := size + 1.! !

!ListaDoble methodsFor: 'adding' stamp: 'LucasIvanBenchatParra 11/3/2025 20:20'!
addNewHeadWithValue: someValue
	"Método utilizado para añadir un nuevo prim
	a la lista doble."
	| newPrim |
	
	(size = 0) ifTrue: [
		"Si la lista está vacía, corresponde
		inicializarla con el valor recibido
		acá."
		^self initializeListWithFirstElement: someValue.
	].

	newPrim := Nodo newNodeWithValue: someValue withPrevious: nil withNext: prim.
	
	prim ant: newPrim.
	prim := newPrim.
	
	size := size + 1.! !

!ListaDoble methodsFor: 'adding' stamp: 'LucasIvanBenchatParra 11/4/2025 15:37'!
addNewElementWithValue: aValue atPosition: aPosition
	"Método utilizado para realizar una suerte
	de inserción intermedia, ya que el usuario
	especifica una posición en la cual insertar
	un nuevo elemento."
	| actual previous newActual |.
	
	(aPosition <= 0 or: aPosition > (size + 1)) ifTrue: [
		"El límite superior se establece como 'size + 1'
		porque se entiende que sería la posición después
		de un hipotético nuevo elemento."
		^self error: 'Introduzca una posición válida dentro de la lista'.
	].
	
	(aPosition = 1) ifTrue: [
		^self addNewHeadWithValue: aValue.
	].
	
	(aPosition = (size + 1)) ifTrue: [
		^self addNewTailWithValue: aValue.
	].

	actual := self nodeAt: aPosition.
	previous := actual ant.
	
	newActual := Nodo newNodeWithValue: aValue withPrevious: previous withNext: actual.
	
	previous prox: newActual.
	actual ant: newActual.
	size := size + 1.! !


!ListaDoble methodsFor: 'instance creation' stamp: 'LucasIvanBenchatParra 11/3/2025 20:18'!
initializeListWithFirstElement: someElement
	"Método utilizado para inicializar
	una instancia de esta clase, teniendo
	un único nodo inicialmente."
	| firstNode |.
	firstNode := Nodo newNodeWithValue: someElement withPrevious: nil withNext: nil.
	size := 1.
	prim := firstNode.
	ult := firstNode.! !


!ListaDoble methodsFor: 'traversing' stamp: 'LucasIvanBenchatParra 11/4/2025 17:25'!
listCollect: aBlock
	"
	Versión personalizada del método
	'collect:', utilizada para recorrer
	listas dobles.
	
	Este iterador recorre la lista de
	entrada y efectúa una o más operaciones
	de manera uniforme sobre todos sus
	elementos.
	"
	| listaSalida |.
	listaSalida := self class new.
	
	self listDo: [ :each |
		listaSalida addNewTailWithValue: (aBlock value: each data).
	].

	^listaSalida.! !

!ListaDoble methodsFor: 'traversing' stamp: 'LucasIvanBenchatParra 11/4/2025 17:23'!
listReject: aBlock
	"
	Versión personalizada del iterador
	'reject:', utilizada para devolver una
	serie de elementos que cumplen una
	condición dada.
	
	Este iterador recorre la lista de entrada
	y guarda en una lista de salida todos los
	elementos que NO cumplan con la condición
	establecida en el cuerpo del iterador al
	llamarlo. 
	"
	| listaSalida |.
	listaSalida := self class new.
	
	self listDo: [ :each |
		(aBlock value: each) ifFalse: [
			listaSalida addNewTailWithValue: (each data).
		].
	].

	^listaSalida.! !

!ListaDoble methodsFor: 'traversing' stamp: 'LucasIvanBenchatParra 11/4/2025 17:24'!
listSelect: aBlock
	"
	Versión personalizada del iterador
	'select:', utilizada para devolver una
	serie de elementos que cumplen una
	condición dada.
	
	Este iterador recorre la lista de entrada
	y guarda en una lista de salida todos los
	elementos que cumplan con la condición
	establecida en el cuerpo del iterador al
	llamarlo. 
	"
	| listaSalida |.
	listaSalida := self class new.
	
	self listDo: [ :each |
		(aBlock value: each) ifTrue: [
			listaSalida addNewTailWithValue: (each data).
		].
	].

	^listaSalida.! !

!ListaDoble methodsFor: 'traversing' stamp: 'LucasIvanBenchatParra 11/3/2025 20:44'!
listDo: aBlock
	"Versión personalizada del método
	'do:', utilizada para recorrer
	listas dobles."
	| pointer |.
	pointer := prim.
	
	[ pointer notNil ] whileTrue: [
		aBlock value: pointer.
		pointer := pointer prox.
	].! !

!ListaDoble methodsFor: 'traversing' stamp: 'LucasIvanBenchatParra 11/4/2025 14:52'!
listReverseDo: aBlock
	"Segunda versión personalizada del
	método 'do:', utilizada para recorrer
	listas dobles al revés, desde el último
	elemento."
	| pointer |.
	pointer := ult.
	
	[ pointer notNil ] whileTrue: [
		aBlock value: pointer.
		pointer := pointer ant.
	].! !


!ListaDoble methodsFor: 'removing' stamp: 'LucasIvanBenchatParra 11/4/2025 16:08'!
removeAllElementsWithValue: aValue
	"Método que sirve para eliminar elementos
	de una lista que tengan un valor determinado.
	Téngase en cuenta que esto elimina todas las
	ocurrencias de un elemento con un valor
	determinado."
	| deletedNodes |.
	deletedNodes := 0.
	
	(size = 0) ifTrue: [
		^self error: 'No se pueden borrar elementos de una lista vacía.'.
	].

	self listDo: [ :each |
		(each data = aValue) ifTrue: [
			| previous next |.
			
			(each == prim)
				ifTrue: [ self removeHead ]
				ifFalse: [
					(each == ult)
						ifTrue: [ self removeTail ]
						ifFalse: [
							previous := each ant.
							next := each prox.
							previous prox: next.
							next ant: previous.
							size := size - 1.
						].
				].
			
			deletedNodes := deletedNodes + 1.
		].
	].

	(deletedNodes = 0) ifTrue: [
		^self error: 'No se encontró ningún elemento con el valor indicado.'.
	].! !

!ListaDoble methodsFor: 'removing' stamp: 'LucasIvanBenchatParra 11/4/2025 11:27'!
removeHead
	"Método que sirve para remover el primer
	elemento, o cabeza, de una lista. Este
	elemento sería 'prim'."
	| secondElement |
	
	(size = 0) ifTrue: [
		^self error: 'No se pueden borrar elementos de una lista vacía.'.
	].
	
	(size = 1) ifTrue: [
		prim := nil.
		ult := nil.
		size := 0.
		^self.
	].

	secondElement := prim prox.
	secondElement ant: nil.
	prim := secondElement.
	size := size - 1.
	^self.! !

!ListaDoble methodsFor: 'removing' stamp: 'LucasIvanBenchatParra 11/4/2025 12:01'!
removeElementWithValue: aValue
	"Método que sirve para eliminar elementos
	de una lista que tengan un valor determinado.
	Téngase en cuenta que esto solo elimina la
	primer ocurrencia de un elemento con un
	valor determinado."
	(size = 0) ifTrue: [
		^self error: 'No se pueden borrar elementos de una lista vacía.'.
	].

	self listDo: [ :each |
		(each data = aValue) ifTrue: [
			| previous next |.
			
			(each == prim) ifTrue: [
				^self removeHead.
			].
			
			(each == ult) ifTrue: [
				^self removeTail.
			].

			previous := each ant.
			next := each prox.
			previous prox: next.
			next ant: previous.
			size := size - 1.
			^self.
		].
	].

	^self error: 'No se encontró ningún elemento con el valor indicado.'.! !

!ListaDoble methodsFor: 'removing' stamp: 'LucasIvanBenchatParra 11/4/2025 11:29'!
removeTail
	"Método que sirve para remover el último
	elemento, o cola, de una lista. Este
	elemento sería 'ult'."
	| newLast |
	
	(size = 0) ifTrue: [
		^self error: 'No se pueden borrar elementos de una lista vacía.'.
	].
	
	(size = 1) ifTrue: [
		prim := nil.
		ult := nil.
		size := 0.
		^self.
	].

	newLast := ult ant.
	newLast prox: nil.
	ult := newLast.
	size := size - 1.
	^self.! !


!ListaDoble methodsFor: 'checking' stamp: 'LucasIvanBenchatParra 11/4/2025 17:50'!
isEmpty
	"Método utilizado para verificar si una
	lista está vacía o no."
	^(size = 0)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ListaDoble class
	instanceVariableNames: ''!

!ListaDoble class methodsFor: 'instance creation' stamp: 'LucasIvanBenchatParra 11/3/2025 19:52'!
newListWithFirstElement: someValue
	"Constructor utilizada para instanciar
	rápidamente una lista doblemente enlazada
	con un primer elemento."
	^self new initializeListWithFirstElement: someValue.! !
