/* Realizar una función que tome dos arreglos y cargue los contenidos de uno en
el otro. */

#include <stdio.h>

void copiar_arreglo(int var_a[10], int var_b[10]) {
    for (int i = 0; i <= 9; i++) {
        var_b[i] = var_a[i];
    }
}

int main(void) {
    int arr_a[10], arr_b[10], i;

    for (i = 0; i <= 9; i++) {
        printf("Introduzca un número para la posición %d del arreglo A: ", i);
        scanf("%d", &arr_a[i]);
    }

    copiar_arreglo(arr_a, arr_b);

    printf("\n");
    printf("Valores del arreglo B\n");
    printf("=====================\n");

    for (i = 0; i <= 9; i++) {
        printf("Valor de la posición %d del arreglo: %d\n", i, arr_b[i]);
    }

    return 0;
}
