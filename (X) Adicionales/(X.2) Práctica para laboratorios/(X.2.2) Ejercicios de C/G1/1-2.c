/* Escribir un programa en C que, dado dos números enteros, realice la suma,
resta, multiplicación, división entera y resto de los mismos. Los números
deben ser ingresados por el usuario. */

#include <stdio.h>

int main() {
    int x, y;

    printf("Ingrese un valor para X: ");
    scanf("%d", &x);
    printf("Ingrese un valor para Y: ");
    scanf("%d", &y);

    int suma = x + y;
    int resta = x - y;
    int mult = x * y;
    int div_ent = x / y;
    int resto = x % y;

    printf("\n");
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
