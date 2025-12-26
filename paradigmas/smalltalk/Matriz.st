'From Pharo8.0.0 of 22 January 2020 [Build information: Pharo-8.0.0+build.1124.sha.0932da82f08175e906b0e2a8052120c823374e9f (64 Bit)] on 10 November 2025 at 11:33:32.343449 pm'!
Object subclass: #Matriz
	instanceVariableNames: 'rows columns data'
	classVariableNames: ''
	package: 'Curso-Estructuras'!
!Matriz commentStamp: 'LucasIvanBenchatParra 10/31/2025 19:11' prior: 0!
"Matriz" es una clase que sirve para definir e interactuar con matrices.

======================
Representación interna
======================
Clase compuesta por las siguientes variables de instancia:
* rows: número de filas de la matriz.
* columns: número de columnas de la matriz.
* data: contiene la matriz en sí.

===========
API Pública
===========
La clase exporta los siguientes métodos para uso público:

	=======
	getters
	=======

	====================================
	Operaciones de creación de instancia
	====================================

	=============
	Constructores
	=============

	=====================
	Operaciones de acceso
	=====================
	
	===========================
	Operaciones de verificación
	===========================
	
	==========================
	Operaciones de comparación
	==========================
	
	=====================
	Operaciones de testeo
	=====================!


!Matriz methodsFor: 'testing' stamp: 'LucasIvanBenchatParra 10/29/2025 19:08'!
isSquare
	^(rows = columns).! !


!Matriz methodsFor: 'printing' stamp: 'LucasIvanBenchatParra 10/30/2025 17:59'!
printOn: aStream
	| widthsArray |.
	widthsArray := self maxColumnWidths.
	
	data withIndexDo: [ :row :rowIndex |
		row withIndexDo: [ :column :colIndex |
			| item diff |.
			item := column asString.
			diff := 0.
			
			"widthsArray es un arreglo usado para contener la
			longitud del elemento más largo de una columna. Se
			puede utilizar las longitudes almacenadas en él para
			calcular la diferencia de caracteres entre el objeto
			actual y el objeto más largo de su columna, para
			saber cuantos espacios en blanco harían falta para
			acomodar la representación del objeto actual, de
			manera que no quede muy fuera de lugar en la columna
			en relación al objeto más largo, provocando que
			las separaciones entre columnas se distorsionen."
			""
			"Esa diferenca es multiplicada por 2 para compensar
			un poco la diferencia de tamaño entre caracteres,
			que provoca varias veces que el espaciado izquierdo
			no acomode los números por completo en relación al
			número más extenso de la columna."
			(item size < widthsArray at: colIndex) ifTrue: [
				diff := ((widthsArray at: colIndex) - item size) * 2.
				diff timesRepeat: [
					aStream nextPut: $ .
				].
			].
			
			aStream nextPutAll: item.
			
			(colIndex < columns) ifTrue: [
				5 timesRepeat: [
					aStream nextPut: $ .
				].
			].
		].
		
		(rowIndex < rows) ifTrue: [
			aStream nextPut: Character cr.
		].
	].! !


!Matriz methodsFor: 'private' stamp: 'LucasIvanBenchatParra 10/29/2025 14:42'!
isValidIndex: ind
	"Método utilizado en constructores y
	otros métodos auxiliares para controlar
	que el usuario está introduciendo un
	número de índice válido."
	"Válido implica que el parámetro sea
	un número y que sea mayor o igual a
	uno."
	(ind isInteger) ifFalse: [
		^false.
	].

	(ind >= 1) ifFalse: [
		^false.
	].

	^true.! !

!Matriz methodsFor: 'private' stamp: 'LucasIvanBenchatParra 10/29/2025 14:45'!
isValidIndex: index withMaxValue: maxval
	((self isValidIndex: index) and: (self isValidIndex: maxval)) ifFalse: [
		^false.
	].

	(index > maxval) ifTrue: [
		^false.
	].
	
	^true.! !

!Matriz methodsFor: 'private' stamp: 'LucasIvanBenchatParra 10/30/2025 16:48'!
maxColumnWidths
	| widthsArray |.
	widthsArray := (Array new: columns) collect: [ :c |
		0.
	].

	data withIndexDo: [ :row :rowIndex |
		row withIndexDo: [ :column :colIndex |
			| item |.
			item := self atRow: rowIndex atColumn: colIndex.
			(item asString size > widthsArray at: colIndex) ifTrue: [
				widthsArray at: colIndex put: (item asString size).
			]. 
		].
	].

	^widthsArray.! !


!Matriz methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/28/2025 14:50'!
columns
	data ifNil: [
		^self error: 'NO hay una estructura de datos cargada como para saber su tamaño.'.
	].

	^columns.! !

!Matriz methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/28/2025 14:50'!
size
	data ifNil: [
		^self error: 'NO hay una estructura de datos cargada como para saber su tamaño.'.
	].
	
	^rows * columns.! !

!Matriz methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/30/2025 12:44'!
transpose
	| result |.
	result := self class new.
	result initializeWithRows: columns withColumns: rows.
	
	data withIndexDo: [ :row :rowIndex |
		| element |.
		row withIndexDo: [ :column :colIndex |
			element := self atRow: rowIndex atColumn: colIndex.
			result atRow: colIndex atColumn: rowIndex put: element.
		].
	].

	^result.! !

!Matriz methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/28/2025 14:50'!
rows
	data ifNil: [
		^self error: 'NO hay una estructura de datos cargada como para saber su tamaño.'.
	].

	^rows.! !

!Matriz methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/30/2025 00:50'!
atRow: row
	(self isValidIndex: row withMaxValue: rows) ifFalse: [
		^self error: 'Introduzca un número de fila dentro de los límites de la matriz.'
	].

	^(data at: row).! !

!Matriz methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/29/2025 14:46'!
atRow: row atColumn: column
	(self isValidIndex: row withMaxValue: rows) ifFalse: [
		^self error: 'Introduzca un número de fila dentro de los límites de la matriz.'
	].
	
	(self isValidIndex: column withMaxValue: columns) ifFalse: [
		^self error: 'Introduzca un número de columna dentro de los límites de la matriz.'
	].
	
	^(data at: row) at: column.! !

!Matriz methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/28/2025 17:39'!
indexOf: element
	| result |.
	result := Dictionary newFrom: { #row -> 0. #column -> 0 }.
	
	data withIndexDo: [ :row :rowIndex |
		row withIndexDo: [ :column :colIndex |
			(column = element) ifTrue: [
				result at: #row put: rowIndex.
				result at: #column put: colIndex.
				^result.
			].
		].
	].

	^result.! !

!Matriz methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/29/2025 14:46'!
atRow: row atColumn: column put: element
	(self isValidIndex: row withMaxValue: rows) ifFalse: [
		^self error: 'Introduzca un número de fila dentro de los límites de la matriz.'
	].
	
	(self isValidIndex: column withMaxValue: columns) ifFalse: [
		^self error: 'Introduzca un número de columna dentro de los límites de la matriz.'
	].

	^(data at: row) at: column put: element.! !

!Matriz methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/30/2025 14:39'!
atColumn: column
	| columnArray |.
	(self isValidIndex: column withMaxValue: columns) ifFalse: [
		^self error: 'Introduzca un número de fila dentro de los límites de la matriz.'
	].

	columnArray := Array new: rows.
	
	data withIndexDo: [ :row :rowIndex |
		columnArray at: rowIndex put: (self atRow: rowIndex atColumn: column).
	].

	^columnArray.! !

!Matriz methodsFor: 'accessing' stamp: 'LucasIvanBenchatParra 10/31/2025 18:57'!
rotateNinetyDegrees
	| traspuesta result |.
	traspuesta := self transpose.
	result := self class new.
	result initializeWithRows: (traspuesta rows) withColumns: (traspuesta columns).

	1 to: (traspuesta rows) do: [ :rowIndex |
		| maxColPosition valueToCopy |.
		maxColPosition := traspuesta columns.
		1 to: (traspuesta columns) do: [ :colIndex |
			| colPosition |.
			colPosition := maxColPosition - colIndex + 1.
			valueToCopy := traspuesta atRow: rowIndex atColumn: colIndex.
			result atRow: rowIndex atColumn: colPosition put: valueToCopy.
		].
	].

	^result.! !


!Matriz methodsFor: 'instance creation' stamp: 'LucasIvanBenchatParra 10/29/2025 14:42'!
initializeWithRows: someRows withColumns: someColumns withElement: element
	| tempArray |.
	((self isValidIndex: someRows) and: (self isValidIndex: someColumns)) ifFalse: [
		^self error: 'Introduzca un número de filas y columnas mayor o igual a uno.'.
	].
	
	tempArray := (Array new: someRows) collect: [ :r |
		(Array new: someColumns) collect: [ :c |
			element.
		].
	].

	rows := someRows.
	columns := someColumns.
	data := tempArray.! !

!Matriz methodsFor: 'instance creation' stamp: 'LucasIvanBenchatParra 10/30/2025 14:31'!
initializeWithRows: someRows withColumns: someColumns
	self
		initializeWithRows: someRows
		withColumns: someColumns
		withElement: nil.! !


!Matriz methodsFor: 'checking' stamp: 'LucasIvanBenchatParra 10/29/2025 14:47'!
isEquallySizedTo: aMatrix
	(self rows = aMatrix rows) ifFalse: [
		^false.
	].

	(self columns = aMatrix columns) ifFalse: [
		^false.
	].

	^true.! !


!Matriz methodsFor: 'comparing' stamp: 'LucasIvanBenchatParra 10/29/2025 15:08'!
= aMatrix
	(self isEquallySizedTo: aMatrix) ifFalse: [
		^false.
	].

	data withIndexDo: [ :row :rowIndex |
		row withIndexDo: [ :column :colIndex |
			(
				(self atRow: rowIndex atColumn: colIndex) =
				(aMatrix atRow: rowIndex atColumn: colIndex)
			) ifFalse: [
				^false.
			].
		].
	].

	^true.! !

!Matriz methodsFor: 'comparing' stamp: 'LucasIvanBenchatParra 10/29/2025 18:39'!
hash
    "Calculates a hash value consistent with the definition of matrix equality (= aMatrix)."
    | result |

    "1. Start with the hashes of the dimensions (rows and columns)."
    result := rows hash bitXor: columns hash.

    "2. Combine the hash of the data (an Array of Arrays)."
    "Array hash recursively combines the hashes of its elements."
    data do: [ :row |
        result := result bitXor: row hash. 
    ].

    ^result.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Matriz class
	instanceVariableNames: ''!

!Matriz class methodsFor: 'instance creation' stamp: 'LucasIvanBenchatParra 10/30/2025 14:32'!
newWithRows: someRows withColumns: someColumns
	^self new
		initializeWithRows: someRows
		withColumns: someColumns.! !

!Matriz class methodsFor: 'instance creation' stamp: 'LucasIvanBenchatParra 10/30/2025 12:46'!
newWithRows: someRows withColumns: someColumns withElement: element
	^self new
		initializeWithRows: someRows
		withColumns: someColumns
		withElement: element.! !
