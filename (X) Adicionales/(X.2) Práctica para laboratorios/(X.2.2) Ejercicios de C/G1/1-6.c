/* Escribir un programa que, dado un número entero, imprima el número por
pantalla, así como su inverso (es decir, con sus dígitos al revés). Por
ejemplo: 1234 imprime 4321. */

#include <stdio.h>

int main(void) {
    int num_us;

    printf("Introduzca un número: ");
    scanf("%d", &num_us);
    printf("Reverso del número: ");

    while (num_us != num_us % 10) {
        printf("%d", num_us % 10);
        num_us = num_us / 10;
    }

    printf("%d\n", num_us);
    return 0;
}
