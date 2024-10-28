/* Escribir un programa en C que, dado dos números enteros, realice la suma,
resta, multiplicación, división entera y resto de los mismos. Los números
son: X = 132 e Y = 34. */

#include <stdio.h>

int main() {
    int x = 132;
    int y = 34;

    int suma = x + y;
    int resta = x - y;
    int mult = x * y;
    int div_ent = x / y;
    int resto = x % y;

    printf("Valor de X: %d\n", x);
    printf("Valor de Y: %d\n", y);

    printf("\n");
    printf("Suma: %d\n", suma);
    printf("Resta: %d\n", resta);
    printf("Multiplicación: %d\n", mult);
    printf("División entera: %d\n", div_ent);
    printf("Resto: %d\n", resto);

    return 0;
}
