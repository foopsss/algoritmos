/* Realizar un algoritmo que verifique si un número es par o impar. */

#include <stdio.h>

int main() {
    int num_us;

    printf("Introduzca un número: ");
    scanf("%d", &num_us);

    if (num_us % 2 == 0) {
        printf("El número es par.\n");
    } else {
        printf("El número NO es par.\n");
    }

    return 0;
}
