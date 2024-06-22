# Compilación de ejercicios
Este documento explica como compilar los ejercicios que hice de las guías de preparación para los laboratorios de lenguajes.

## Pascal
Se asume para esta parte que el compilador utilizado es Free Pascal, ya que es el que recomienda la cátedra.

### Manual
Los ejercicios pueden ser compilados tanto en Linux como en Windows con una simple invocación al compilador: `fpc <nombre del archivo>`.

### Con pas.sh (Linux)
`pas.sh` es un pequeño script de Bash que facilita algunas acciones al trabajar con Pascal, como compilar y ejecutar los ejercicios. Cuenta con tres parámetros que se le pueden pasar al ejecutarlo:

1. **l** (location): permite especificar el directorio en el cual se va a realizar una acción. Debe ser el primer parámetro a especificar en caso de usarlo.
2. **r** (run): permite especificar el nombre del archivo con el código a compilar y ejecutar. No se debe incluir la extensión del archivo al especificarlo.
3. **d** (delete): permite especificar el nombre del ejercicio cuyos archivos resultantes de la compilación se quieren borrar.

De esta forma, si se quisiera compilar y ejecutar el ejercicio 1-1 de la carpeta G1, utilizaría el comando `./pas.sh -l G1 -r 1-1`. Luego, si quisiera borrar todos los archivos resultantes de compilar el ejercicio, utilizaría el comando `./pas.sh -l G1 -d 1-1`.

- **NOTA**: algunos ejercicios utilizan una librería (functions) que creé para abstraer algunas funciones comunes. Esa librería también es compilada al compilar un ejercicio que la utilice, y se pueden borrar los archivos resultantes de su compilación con el comando `./pas.sh -d functions`.