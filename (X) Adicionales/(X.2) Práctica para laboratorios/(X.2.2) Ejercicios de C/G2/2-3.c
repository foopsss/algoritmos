/* Modificar la función de carga creada en el ejercicio anterior para cargar el
arreglo de forma aleatoria, con números que vayan del 1 al 100. */

// Material para este ejercicio:
// https://stackoverflow.com/questions/822323/how-to-generate-a-random-int-in-c
// https://www.cs.yale.edu/homes/aspnes/pinewiki/C(2f)Randomization.html

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void cargar_arreglo(int var_arr[10]) {
    // Preparación (seeding) del generador de números aleatorios.
    srand(time(NULL));

    for (int i = 0; i <= 9; i++) {
        // La cota superior del intervalo de números deseados es 101, entonces
        // el número 100 queda incluido en dicho intervalo. Se le suma 1 al
        // resultado final en caso de que el número generado por rand() sea 0,
        // ya que la cota inferior del intervalo de números deseados es 1.
        var_arr[i] = (rand() % 101) + 1;
    }
}

void mostrar_arreglo(int var_arr[10]) {
    printf("Valores cargados\n");
    printf("================\n");

    for (int i = 0; i <= 9; i++) {
        printf("Valor de la posición %d del arreglo: %d\n", i, var_arr[i]);
    }
}

int main(void) {
    int arr_ent[10];
    cargar_arreglo(arr_ent);
    mostrar_arreglo(arr_ent);
    return 0;
}
