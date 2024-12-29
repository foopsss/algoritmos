{* Programa que carga una lista doblemente enlazada y agrupa (suma) todos sus
elementos, de manera tal que al final solo queden elementos mayores o iguales
que un determinado número ingresado por el usuario, siempre que sea posible.  *}

program agrupa1;

uses
	functions in '../functions.pas';

type
    puntero = ^Nodo;

    Nodo = record
        dato: integer;
        ant: puntero;
        prox: puntero;
    end;

var
    valores: array of integer = (3, 4, 2, 4, 1, 4, 4, 3, 2, 2, 4, 1, 4, 1, 4, 4, 1, 4, 4, 2);
    i, val_us: integer;

    prim, ult, aux, q: puntero;

procedure cargar_lista(val: integer);
var
    p: puntero;
begin
    New(p);
    p^.dato := val;
    p^.ant := NIL;
    p^.prox := NIL;

    if prim = NIL then
        begin
            prim := p;
            ult := p;
        end
    else
        begin
            aux^.prox := p;
            p^.ant := aux;
            ult := p;
        end;

    aux := p;
end;

procedure agrupa(A: integer);
var
    r: puntero;
begin
    q := prim;

    while q <> NIL do
    begin
        // Trabajo con un resguardo en el que voy a guardar
        // temporalmente los elementos a sumar en la posición
        // actual.
        r := q^.prox;

        // Controlo que todavía pueda agrupar elementos en la
        // posición actual, y que no esté parado en el último
        // elemento de la lista.
        //
        // Controlo esto último porque hay casos donde puedo
        // agrupar en función de un valor A lo suficientemente
        // grande como para que solo quede un único valor de L
        // sin tratar al final del proceso, por lo que ya no
        // puedo continuar agrupando.
        //
        // Esto sucedería, por ejemplo, cuando A = 13.
        while (q^.dato < A) and (q <> ult) do
        begin
            // A mi posición actual le sumo el siguiente valor.
            q^.dato := q^.dato + r^.dato;

            // Debo borrar el elemento que sumé. Para ello:
            // 1. Resguardo el elemento a borrar y avanzo al
            //    siguiente.
            aux := r;
            r := r^.prox;

            // 2. Enlazo mi elemento actual con el que le sigue
            //    al que se encuentra adelante.
            q^.prox := r;

            // 3. Si todavía no estoy parado en el último elemento,
            //    hago el proceso inverso. Es decir, enlazo el nuevo
            //    siguiente elemento con mi elemento actual (como ant).
            //
            //    Por el contrario, si el nuevo prox es NIL, es porque
            //    ya procesé el último elemento de la lista. Reasigno
            //    ult.
            if r <> NIL then
                r^.ant := q
            else
                ult := q;

            // 4. Finalmente, borro el resguardo.
            Dispose(aux);
        end;

        q := q^.prox;
    end;
end;

begin
    prim := NIL;
    ult := NIL;
    aux := NIL;

    // Primero, hay que cargar la lista.
    for i in valores do
    begin
        cargar_lista(i);
    end;

    writeln('Valores originales de la lista:');
    q := prim;

    while q <> NIL do
    begin
        if q <> ult then
            write(q^.dato, ' ')
        else
            writeln(q^.dato);

        q := q^.prox;
    end;

    // Con la lista cargada, corresponde agrupar los elementos.
    draw_line(60, '=');
    write('Introduzca un valor por el cual agrupar los elementos: ');
    readln(val_us);
    agrupa(val_us);

    // Ahora, para comprobar si funcionó...
    draw_line(60, '=');
    writeln('Valores restantes de la lista:');
    q := prim;

    while q <> NIL do
    begin
        if q <> ult then
            write(q^.dato, ' ')
        else
            writeln(q^.dato);

        aux := q;
        q := q^.prox;
        Dispose(aux);
    end;
end.
