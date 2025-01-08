# Compilación de ejercicios
Este documento explica como compilar los ejercicios que hice de las guías de preparación para los laboratorios de lenguajes.

## Pascal
Se asume para esta parte que el compilador utilizado es [Free Pascal](https://es.wikipedia.org/wiki/Free_Pascal), ya que es el que recomienda la cátedra.

### Manual
Los ejercicios pueden ser compilados tanto en Linux como en Windows con una simple invocación al compilador: `fpc <nombre del archivo>`.

### Con pas.sh (Linux)
`pas.sh` es un pequeño script de Bash que facilita algunas acciones al trabajar con Pascal, como compilar y ejecutar los ejercicios. Cuenta con cuatro parámetros que se le pueden pasar al ejecutarlo:

1. **l** (location): permite especificar el directorio en el cual se va a realizar una acción.
2. **c** (compile): permite especificar el nombre del archivo con el código a compilar.
3. **g**: permite especificar el nombre del archivo con el código a compilar, con la diferencia de que el ejecutable resultante incluirá información de depuración, útil para depurar el programa compilado con software como [GDB](https://es.wikipedia.org/wiki/GNU_Debugger).
4. **r** (run): permite especificar el nombre del archivo con el código a compilar y ejecutar.
5. **d** (delete): permite especificar el nombre del ejercicio cuyos archivos resultantes de la compilación se quieren borrar.

De esta forma, si quisiera compilar y ejecutar el ejercicio 1-1 de la carpeta G1, utilizaría el comando `./pas.sh -l G1 -r 1-1`. Luego, si quisiera borrar todos los archivos resultantes de compilar el ejercicio, utilizaría el comando `./pas.sh -l G1 -d 1-1`.

- **NOTA**: algunos ejercicios utilizan una librería (functions) que creé para abstraer algunas funciones comunes. Esa librería también es compilada al compilar un ejercicio que la utilice, y se pueden borrar los archivos resultantes de su compilación con el comando `./pas.sh -d functions`.

## C
Se asume para esta parte que el compilador utilizado es [GCC](https://es.wikipedia.org/wiki/GNU_Compiler_Collection) (provisto en Windows como parte de [MinGW](https://es.wikipedia.org/wiki/MinGW)), ya que es el que recomienda la cátedra.

### Manual
Los ejercicios pueden ser compilados tanto en Linux como en Windows con una simple invocación al compilador: `gcc <nombre del archivo> -o <nombre del archivo>`.

### Con c.sh (Linux)
`c.sh` es un pequeño script de Bash que facilita algunas acciones al trabajar con C, como compilar y ejecutar los ejercicios. Cuenta con seis parámetros que se le pueden pasar al ejecutarlo:

1. **l** (location): permite especificar el directorio en el cual se va a realizar una acción.
2. **p** (platform): permite especificar si se quiere compilar usando GCC o MinGW (también disponible en Linux), así como el archivo a ejecutar y/o borrar. Si la entrada es "mgw" se compila de forma cruzada/ejecuta/borra un ejecutable para Windows, y para Linux en cualquier otro caso (o si no se especifica).
3. **c** (compile): permite especificar el nombre del archivo con el código a compilar.
4. **g**: permite especificar el nombre del archivo con el código a compilar, con la diferencia de que el ejecutable resultante incluirá información de depuración, útil para depurar el programa compilado con software como [GDB](https://es.wikipedia.org/wiki/GNU_Debugger).
5. **r** (run): permite especificar el nombre del archivo con el código a compilar y ejecutar.
6. **d** (delete): permite especificar el nombre del ejercicio cuyo archivo resultante de la compilación se quiere borrar.

De esta forma, si quisiera compilar y ejecutar el ejercicio 1-1 de la carpeta G1, utilizaría el comando `./c.sh -l G1 -r 1-1`. Luego, si quisiera borrar todos los archivos resultantes de compilar el ejercicio, utilizaría el comando `./c.sh -l G1 -d 1-1`.

# Consideraciones a la hora de usar los scripts
1. Los parámetros deben especificarse en el orden en el que los detallé arriba.
2. No es necesario especificar la extensión de los archivos con el código a compilar/ejecutar, o aquellos que se quieren borrar.
3. Los ejecutables compilados con información de depuración siempre van a llevar el sufijo "-dbg", para distinguirlos claramente de los normales. Se debe tomar esto en cuenta si se quiere usar los scripts para borrarlos luego.
