{* Se tiene un archivo con los empleados de una empresa que posee los siguientes
campos: planta, categoría y nombre del empleado. La categoría es un número entero
que va del uno al cuatro.

Se pide mostrar el nombre de cada trabajador y la cantidad de trabajadores que
hay por categoría, planta y total general.

Asimismo, también se solicita que:
(a) Se mejore el formato del informe con respecto del ejercicio anterior (3-8a).
(b) Se genere un archivo de salida, con el mismo formato que el archivo de entrada,
    que registre todos los empleados de categoría 4.
(c) Se genere un segundo archivo de salida, que registre la cantidad de empleados
    por planta. *}

// NOTA: esta es la versión del ejercicio 3.8 que utiliza archivos de texto
// plano, tal y como especifiqué en la versión principal.

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
// Para hacer paso de parámetros por referencia también necesito esta directiva.
{$mode objfpc}

program EJ8;

uses
    functions in '../functions.pas',
    sysutils;

type
    empleado = record
        planta: char;
        categoria: integer;
        nombre: string[100];
    end;

    planta = record
        planta: char;
        cant_emp: integer;
    end;

    puntero = ^Nodo;

    Nodo = record
        nombre: string[100];
        prox: puntero;
    end;

var
    entrada, salida_cat_cuatro, salida_emp_planta: TextFile;
    reg_emp: empleado;
    reg_planta: planta;

    resg_planta: char;
    resg_categoria, tot_emp_planta, tot_emp_categoria, tot_gen: integer;
    prim, aux: puntero;

procedure leer_archivo();
begin
    readln(entrada, reg_emp.planta);
    readln(entrada, reg_emp.categoria);
    readln(entrada, reg_emp.nombre);
end;

procedure inicializar();
begin
    resg_categoria := reg_emp.categoria;
    resg_planta := reg_emp.planta;
    tot_emp_categoria := 0;
    tot_emp_planta := 0;
    tot_gen := 0;
end;

procedure cargar_lista(nombre_emp: string);
var
    p: puntero;
begin
    New(p);
    p^.nombre := nombre_emp;
    p^.prox := NIL;

    if prim = NIL then
        prim := p
    else
        aux^.prox := p;

    aux := p;
end;

procedure mostrar_lista(VAR prim_list: puntero);
var
    q: puntero;
begin
    q := prim_list;

    while q <> NIL do
    begin
        writeln(q^.nombre);
        aux := q;
        q := q^.prox;
        Dispose(aux);
    end;

    // Entiendo que prim queda apuntando a una
    // dirección de memoria que técnicamente ya
    // no existe, así que lo correcto sería liberar
    // este puntero también.
    prim_list := NIL;
end;

procedure corte_categoria();
begin
    writeln('Planta: ', resg_planta);
    writeln('Categoría: ', resg_categoria);
    writeln('Total de trabajadores en la categoria: ', tot_emp_categoria);
    tot_emp_planta := tot_emp_planta + tot_emp_categoria;
    tot_emp_categoria := 0;
    resg_categoria := reg_emp.categoria;
end;

procedure corte_planta();
begin
    corte_categoria();
    writeln('Planta: ', resg_planta);
    writeln('Total de trabajadores en la planta: ', tot_emp_planta);

    // Grabo el segundo archivo de salida.
    reg_planta.planta := resg_planta;
    writeln(salida_emp_planta, reg_planta.planta);
    reg_planta.cant_emp := tot_emp_planta;
    writeln(salida_emp_planta, reg_planta.cant_emp);

    tot_gen := tot_gen + tot_emp_planta;
    tot_emp_planta := 0;
    resg_planta := reg_emp.planta;
    draw_line(50, '=');
end;

procedure procesar_registro();
begin
    // procesar_registro es donde hago la parte de
    // incrementar contadores y verificar si un
    // empleado es de categoría cuatro.
    // Lo abstraigo en un procedimiento porque también
    // debo hacerlo por fuera del ciclo principal.
    // Explicado debajo del "while not eof(entrada)".
    if reg_emp.categoria = 4 then
    begin
        writeln(salida_cat_cuatro, reg_emp.planta);
        writeln(salida_cat_cuatro, reg_emp.categoria);
        writeln(salida_cat_cuatro, reg_emp.nombre);
    end;
    tot_emp_categoria := tot_emp_categoria + 1;
end;

begin
    assign(entrada, 'Salidas/salida-ej8-gen-ext.txt');
    assign(salida_cat_cuatro, 'Salidas/salida-ej8-ext-cat-cuatro.txt');
    assign(salida_emp_planta, 'Salidas/salida-ej8-ext-emp-planta.txt');

    try
        reset(entrada);
        rewrite(salida_cat_cuatro);
        rewrite(salida_emp_planta);
        leer_archivo();
        inicializar();

        while not eof(entrada) do
        begin
            // Para mostrar el listado de empleados de manera
            // más presentable utilizo una lista simplemente
            // enlazada, entonces puedo guardar los nombres
            // para mostrarlos al final.
            cargar_lista(reg_emp.nombre);

            if resg_planta <> reg_emp.planta then
                corte_planta()
            else
                if resg_categoria <> reg_emp.categoria then
                    corte_categoria();

            procesar_registro();
            leer_archivo();
        end;

        // Por algún motivo, el ciclo principal termina aún
        // cuando todavía tengo una entrada disponible en
        // reg_emp, así que debo encargarme de terminar
        // correctamente el conteo acá.
        // Luego, naturalmente debo llamar una vez más a la
        // subacción de corte de mayor nivel, y recién ahí
        // puedo mostrar el total correcto de empleados.
        procesar_registro();
        cargar_lista(reg_emp.nombre);
        corte_planta();
        writeln('Total general de empleados: ', tot_gen);

        // Muestro los nombres de los empleados.
        draw_line(50, '=');
        writeln('Listado de empleados de la empresa: ');
        mostrar_lista(prim);

        // Cierro los archivos de entrada y salida.
        close(entrada);
        close(salida_cat_cuatro);
        close(salida_emp_planta);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular uno de los archivos.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.
