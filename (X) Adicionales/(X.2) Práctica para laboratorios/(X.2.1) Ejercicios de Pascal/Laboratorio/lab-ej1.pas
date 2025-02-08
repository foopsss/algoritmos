{* Un supermercado necesita conocer el total de las ventas realizadas en un día.
El archivo "entrada-lab-ej1.txt" contiene los registros de ventas, con el código
del artículo vendido (cuatro caracteres) y el precio de venta (tres caracteres).

Ejemplo: 00012250001450003200

Es decir, se vendió el artículo 0001 por un importe de $225, luego el artículo
0001 nuevamente, por un importe de $450, y por último el artículo 0003 por un
importe de $200.

Se pide: ¿cuál es la cantidad de ventas que superaron el importe de $400? *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ1;

uses
    functions in '../functions.pas',
    math,
    sysutils;

var
    entrada: TextFile;
    v_ent: char;

    i, cant_ventas: integer;
    importe: LongInt;

procedure inicializar();
begin
    importe := 0;
    cant_ventas := 0;
end;

begin
    assign(entrada, 'Materiales/entrada-lab-ej1.txt');

    try
        reset(entrada);
        inicializar();
        read(entrada, v_ent);

        while not eof(entrada) do
        begin
            for i := 1 to 4 do
            begin
                read(entrada, v_ent);
            end;

            for i := 3 downto 1 do
            begin
                importe := importe + CharToInt(v_ent) * (10 ** (i - 1));
                read(entrada, v_ent);
            end;

            if importe > 400 then
            begin
                cant_ventas := cant_ventas + 1;
            end;

            importe := 0;
        end;

        writeln('Cantidad de ventas que superan los $400: ', cant_ventas);
        close(entrada);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular el archivo.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.