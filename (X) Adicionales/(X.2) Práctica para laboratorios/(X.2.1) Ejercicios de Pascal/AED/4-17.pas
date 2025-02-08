{* Teniendo en cuenta el ejercicio 1.20 del TP2: “Se posee 2 secuencias (S1 y S2)
con las cuales se desea generar una nueva secuencia (SAL) donde se intercalen las
palabras de las secuencias de entrada, de la siguiente manera: copiar de S1 aquellas
palabras que empiezan y terminan con la misma letra y de S2 aquellas palabras que
posean al menos un digito numérico y además estén en posición par.”. Escribir un
algoritmo que lo resuelva, teniendo en cuenta que conoce la estructura de listas. *}

// Material para este ejercicio:
// https://wiki.freepascal.org/Pointer
// https://wiki.freepascal.org/Basic_Pascal_Tutorial/Chapter_5/Pointers
// https://codeforwin.org/data-structures/c-program-to-delete-all-nodes-of-singly-linked-list

// Pongo el compilador en modo OBJFPC para poder establecer parámetros por
// defecto en el procedimiento tratar_lista. También lo necesito para poder usar
// las palabras reservadas "try" y "except". Voy a utilizar ademñas con este fin
// la librería "sysutils".
{$mode objfpc}

program EJ17;

uses
    sysutils;

type
    puntero = ^Nodo;

    Nodo = record
        dato: char;
        prox: puntero;
    end;

    // En vez de asignarle "file of char" a las variables de
    // los archivos directamente, uso esta definición para
    // luego poder usarla en el parámetro "sec" de la subacción
    // "avz_car". De lo contrario, el compilador se queja.
    archivo = file of char;

const
    signos = [',', '.', '!'];
    numeros = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

var
    entrada1, entrada2, salida: archivo;
    v_ent1, v_ent2: char;

    prim, aux, q: puntero;
    cont_letras_pal_sec1, cont_pal_sec2: integer;

procedure cargar_lista(car: char);
var
    p: puntero;
begin
    New(p);
    p^.dato := car;
    p^.prox := NIL;

    if prim = NIL then
        prim := p
    else
        aux^.prox := p;

    aux := p;
end;

procedure avz_car(VAR sec: archivo; VAR v: char; ent: integer);
begin
    while (v = ' ') or (v in signos) do
    begin
        read(sec, v);
    end;

    // ent es una variable que permite especificar si se está
    // trabajando con el primer o el segundo archivo de entrada.
    //
    // Valores posibles:
    // 1 = entrada1.
    // 2 = entrada2.
    if ent = 2 then
    begin
        cont_pal_sec2 := cont_pal_sec2 + 1;
    end;

    while (v <> ' ') and not (v in signos) do
    begin
        if ent = 1 then
        begin
            cont_letras_pal_sec1 := cont_letras_pal_sec1 + 1;
        end;

        cargar_lista(v);
        read(sec, v);
    end;
end;

procedure tratar_lista(VAR prim_var: puntero; op: integer = 0);
begin
    // tratar_lista es un procedimiento generalizado
    // para realizar varias acciones con la lista:
    //
    // Posibles valores de op:
    // 0: valor por defecto, significa que solo se recorre
    //    la lista.
    // 1: para cargar elementos de la lista en la salida.
    // 2: para borrar todos los elementos de la lista.
    //
    // Los valores 1 y 2 deben ser especificados al llamar
    // el procedimiento. El valor 0 no porque es un valor
    // por defecto.
    q := prim_var;

    while q <> NIL do
    begin
        if op = 1 then
        begin
            write(salida, q^.dato);
        end;

        aux := q;
        q := q^.prox;

        if op = 2 then
        begin
            Dispose(aux);
        end;
    end;

    if op = 1 then
        write(salida, ' ')
    else
        if op = 2 then
        begin
            prim := NIL;
            aux := NIL;
        end;
end;

function tiene_numeros(VAR prim_var: puntero): boolean;
begin
    q := prim_var;

    while q <> NIL do
    begin
        if q^.dato in numeros then
            begin
                tiene_numeros := true;
                break;
            end
        else
            tiene_numeros := false;

        q := q^.prox;
    end;
end;

begin
    assign(entrada1, 'Materiales/entrada1-ej417.txt');
    assign(entrada2, 'Materiales/entrada2-ej417.txt');
    assign(salida, 'Salidas/salida-ej417.txt');

    try
        reset(entrada1);
        reset(entrada2);
        rewrite(salida);
        read(entrada1, v_ent1);
        read(entrada2, v_ent2);
        cont_pal_sec2 := 0;

        while not eof(entrada1) and not eof(entrada2) do
        begin
            tratar_lista(prim, 2);
            cont_letras_pal_sec1 := 0;
            avz_car(entrada1, v_ent1, 1);
            tratar_lista(prim);

            if (cont_letras_pal_sec1 > 1) then
            begin
                // Con esto contemplo tanto los casos de que ambas letras sean la
                // misma y estén escritas en minúscula, o que ambas sean la misma
                // pero una esté escrita en minúscula y la otra en mayúscula.
                if (prim^.dato = aux^.dato) or (prim^.dato = UpCase(aux^.dato)) then
                begin
                    tratar_lista(prim, 1);
                end;
            end;

            tratar_lista(prim, 2);
            avz_car(entrada2, v_ent2, 2);

            if tiene_numeros(prim) and (cont_pal_sec2 mod 2 = 0) then
            begin
                tratar_lista(prim, 1);
            end;
        end;

        while not eof(entrada1) do
        begin
            tratar_lista(prim, 2);
            cont_letras_pal_sec1 := 0;
            avz_car(entrada1, v_ent1, 1);
            tratar_lista(prim);

            if (cont_letras_pal_sec1 > 1) then
            begin
                if (prim^.dato = aux^.dato) or (prim^.dato = UpCase(aux^.dato)) then
                begin
                    tratar_lista(prim, 1);
                end;
            end;
        end;

        while not eof(entrada2) do
        begin
            tratar_lista(prim, 2);
            avz_car(entrada2, v_ent2, 2);

            if tiene_numeros(prim) and (cont_pal_sec2 mod 2 = 0) then
            begin
                tratar_lista(prim, 1);
            end;
        end;

        tratar_lista(prim, 2);
        close(entrada1);
        close(entrada2);
        close(salida);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular uno de los archivos.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.
