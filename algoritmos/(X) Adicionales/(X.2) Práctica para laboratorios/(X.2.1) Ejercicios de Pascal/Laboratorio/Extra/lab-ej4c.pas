{* Se tiene un archivo que almacena datos de jugadoras de FIFA a nivel mundial
(entrada-lab-ej4.csv) y contiene la siguiente información: ID de la jugadora,
versión de FIFA, nombre de la jugadora, edad, altura, peso, país de nacimiento
y pie preferido.

Se pide: ¿cuál es el porcentaje de jugadoras de treinta años o más que prefieren
utilizar el pie derecho para patear? *}

// Material para este ejercicio:
// https://stackoverflow.com/questions/9831731/reading-a-file-in-freepascal
// https://forum.lazarus.freepascal.org/index.php?topic=46021.0
// https://wiki.freepascal.org/SDF
// https://www.freepascal.org/docs-html/rtl/classes/tstrings.html
// https://www.freepascal.org/docs-html/rtl/classes/tstringlist.html
// https://www.freepascal.org/docs-html/rtl/classes/tstrings.delimiter.html
// https://www.freepascal.org/docs-html/rtl/classes/tstrings.strictdelimiter.html
// https://www.freepascal.org/docs-html/rtl/classes/tstrings.delimitedtext.html
// https://www.freepascal.org/docs-html/rtl/classes/tstrings.count.html

{$mode objfpc}
program EJ4;

uses
    // Provee el tipo de dato "TStringList".
    classes,
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
    // TStringList es un tipo de dato compuesto, que consiste
    // básicamente en un arreglo dinámico de strings. Este tipo
    // de dato está definido en la librería "classes".
    //
    // TStringList se puede utilizar con archivos CSV pero está
    // pensado para el formato de archivos SDF, que se parece
    // mucho a CSV pero no es exactamente igual.
    entrada_csv: TStringList;
    v_csv: TStringList;
    jugadora: info_jugadora;

    i: integer;
    cant_jugadoras, der_treinta: integer;
    porc_der_treinta: real;

procedure inicializar();
begin
    entrada_csv := TStringList.Create();
    v_csv := TStringList.Create();
    cant_jugadoras := 0;
    der_treinta := 0;
end;

begin
    inicializar();

    try
        // Establezo el separador de campos para la ventana.
        //
        // También indico que no quiero separar líneas si estas
        // consisten en oraciones con palabras y espacios.
        v_csv.Delimiter := ';';
        v_csv.StrictDelimiter := true;
        entrada_csv.LoadFromFile('../Materiales/entrada-lab-ej4.csv');

        // Cuento desde uno en adelante porque la primer línea
        // del archivo no me interesa, ya que es la cabecera del
        // archivo.
        // El límite es "entrada_csv.count - 1" ya que así lo
        // estipula la propiedad "TString.Count".
        for i := 1 to (entrada_csv.count - 1) do
        begin
            cant_jugadoras := cant_jugadoras + 1;

            // Leo una línea del archivo.
            //
            // La propiedad DelimitedText separa los campos en cada
            // línea en función del delimitador que especifiqué con
            // anterioridad.
            v_csv.DelimitedText := entrada_csv[i];
            jugadora.id := StrToInt(v_csv[0]);
            jugadora.version_fifa := StrToFloat(v_csv[1]);
            jugadora.nombre := v_csv[2];
            jugadora.edad := StrToInt(v_csv[3]);
            jugadora.altura := StrToInt(v_csv[4]);
            jugadora.peso := StrToInt(v_csv[5]);
            jugadora.nacionalidad := v_csv[6];
            jugadora.pie_preferido := v_csv[7];

            if (jugadora.edad >= 30) and (jugadora.pie_preferido = 'Right') then
            begin
                der_treinta := der_treinta + 1;
            end;
        end;

        porc_der_treinta := (der_treinta * 100) / cant_jugadoras;
        writeln('Porcentaje de jugadoras que cumplen la condición: ', porc_der_treinta:4:2);
    finally
        entrada_csv.free;
        v_csv.free;
    end;
end.