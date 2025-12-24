{* Un supermercado necesita conocer el total de las ventas realizadas en un día.
El archivo "entrada-lab-ej1.txt" contiene los registros de ventas, con el código
del artículo vendido (cuatro caracteres) y el precio de venta (tres caracteres).

Ejemplo: 000122500014500003200

Es decir, se vendió el artículo 0001 por un importe de $225, luego el artículo
0001 nuevamente, por un importe de $450, y por último el artículo 0003 por un
importe de $200.

Se pide: ¿cuántos artículos con código 1001 se vendieron? *}

// NOTA: para este ejercicio reutilizo la entrada del primer ejercicio que subí
// en la carpeta, porque no pude conseguir el archivo específico de este. Puedo
// hacer esto porque son consignas muy similares, y sus entradas tienen el mismo
// formato.

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ7;

uses
    functions in '../functions.pas',
    math,
    sysutils;

var
    entrada: TextFile;
    v_ent: char;

    i, codigo_art, cant_ventas: integer;

begin
    assign(entrada, 'Materiales/entrada-lab-ej1.txt');

    try
        reset(entrada);
        cant_ventas := 0;
        read(entrada, v_ent);

        while not eof(entrada) do
        begin
            codigo_art := 0;

            for i := 4 downto 1 do
            begin
                codigo_art := codigo_art + CharToInt(v_ent) * (10 ** (i - 1));
                read(entrada, v_ent);
            end;

            for i := 1 to 3 do
            begin
                read(entrada, v_ent);
            end;

            if codigo_art = 1001 then
            begin
                cant_ventas := cant_ventas + 1;
            end;
        end;

        writeln('Cantidad de artículos de tipo 1001 vendidos: ', cant_ventas);
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