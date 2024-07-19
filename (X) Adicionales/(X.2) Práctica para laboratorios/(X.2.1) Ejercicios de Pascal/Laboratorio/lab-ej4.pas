{* Se tiene un archivo que almacena datos de jugadoras de FIFA a nivel mundial
(entrada-lab-ej4.csv) y contiene la siguiente información: ID de la jugadora,
versión de FIFA, nombre de la jugadora, edad, altura, peso, país de nacimiento
y pie preferido.

Se pide: ¿cuál es el porcentaje de jugadoras de treinta años o más que prefieren
utilizar el pie derecho para patear? *}

// Material para este ejercicio:
// https://wiki.freepascal.org/CSV
// https://wiki.freepascal.org/CsvDocument
// https://www.freepascal.org/daily/doc/fcl/csvdocument/tcsvdocument.html

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "finally".
{$mode objfpc}

program EJ4;

uses
	// Provee el tipo de dato TCSVDocument.
	csvdocument,
	// Provee las funciones "StrToInt" y "StrToFloat".
	sysutils;

type
	info_jugadora = record
		id: integer;
		version_fifa: real;
		nombre: string[150];
		edad: integer;
		altura: integer;
		peso: integer;
		nacionalidad: string[100];
		pie_preferido: string[50];
	end;

var
	// TCSVDocument es un tipo de dato que se trata de una
	// representación en memoria de un archivo CSV.
	entrada_csv: TCSVDocument;
	jugadora: info_jugadora;

	i: integer;
	cant_jugadoras, der_treinta: integer;
	porc_der_treinta: real;

procedure inicializar();
begin
	entrada_csv := TCSVDocument.Create();
	cant_jugadoras := 0;
	der_treinta := 0;
end;

begin
	inicializar();

	// La documentación en la wiki de Free Pascal recomienda
	// englobar el uso de estas operatorias en un bloque con
	// las palabras "try" y "finally" para evitar fugas de
	// memoria.
	try
		// Establezo el separador de campos de cada campo del archivo.
		// También cargo el archivo en memoria.
		entrada_csv.Delimiter := ';';
		entrada_csv.LoadFromFile('Materiales/entrada-lab-ej4.csv');

		// Cuento desde uno en adelante porque la primer línea
		// del archivo no me interesa, ya que es la cabecera del
		// archivo.
		// El límite es "entrada_csv.RowCount - 1" ya que de lo
		// contrario imprimo una línea en blanco al final.
		for i := 1 to (entrada_csv.RowCount - 1) do
		begin
			cant_jugadoras := cant_jugadoras + 1;

			jugadora.id := StrToInt(entrada_csv.Cells[0, i]);
			jugadora.version_fifa := StrToFloat(entrada_csv.Cells[1, i]);
			jugadora.nombre := entrada_csv.Cells[2, i];
			jugadora.edad := StrToInt(entrada_csv.Cells[3, i]);
			jugadora.altura := StrToInt(entrada_csv.Cells[4, i]);
			jugadora.peso := StrToInt(entrada_csv.Cells[5, i]);
			jugadora.nacionalidad := entrada_csv.Cells[6, i];
			jugadora.pie_preferido := entrada_csv.Cells[7, i];

			if (jugadora.edad >= 30) and (jugadora.pie_preferido = 'Right') then
			begin
				der_treinta := der_treinta + 1;
			end;
		end;

		porc_der_treinta := (der_treinta * 100) / cant_jugadoras;
		writeln('Porcentaje de jugadoras que cumplen la condición: ', porc_der_treinta:4:2);
	finally
		entrada_csv.free;
	end;
end.