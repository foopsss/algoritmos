// Documentación útil para la librería:
// https://www.freepascal.org/docs-html/user/userse33.html

// Necesito poner el compilador en modo OBJFPC para poder establecer parámetros
// por defecto en una subacción.
{$mode objfpc}

unit functions;

interface
    function CharToInt(entrada: char): integer;
    procedure draw_line(length: integer; symbol: char = ' ');
    procedure error_lectura_archivo();

implementation
    function CharToInt(entrada: char): integer;
    begin
        case entrada of
            '0': CharToInt := 0;
            '1': CharToInt := 1;
            '2': CharToInt := 2;
            '3': CharToInt := 3;
            '4': CharToInt := 4;
            '5': CharToInt := 5;
            '6': CharToInt := 6;
            '7': CharToInt := 7;
            '8': CharToInt := 8;
            '9': CharToInt := 9;
        end;
    end;

    procedure draw_line(length: integer; symbol: char = ' ');
    var
        i: integer;
    begin
        for i := 0 to (length - 1) do
        begin
            if symbol = ' ' then
                write('-')
            else
                write(symbol);
        end;

        if symbol = ' ' then
            writeln('-')
        else
            writeln(symbol);
    end;

    procedure error_lectura_archivo();
    begin
        writeln('¡Error!');
        writeln('No se pudo abrir el archivo.');
        halt(1);
    end;

end.