#include <stdio.h>
#define INF 9999
#define MAX 10

void Dijkstra(int grafo[MAX][MAX], int n, int comienzo) {
  int costo[MAX][MAX], distancia[MAX], pred[MAX];
  int visitado[MAX], cont, mindistancia, prox_vertice, i, j;

  // Creando matriz de costo
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      if (grafo[i][j] == 0)
        costo[i][j] = INF;
      else
        costo[i][j] = grafo[i][j];

  for (i = 0; i < n; i++) {
    distancia[i] = costo[comienzo][i];
    pred[i] = comienzo;
    visitado[i] = 0;
  }
  mindistancia = INF;
  distancia[comienzo] = 0;
  visitado[comienzo] = 1;
  cont = 1;

  while (cont < n - 1) {
    mindistancia = INF;

    for (i = 0; i < n; i++)
      if (distancia[i] < mindistancia && visitado[i]==0) {
        mindistancia = distancia[i];
        prox_vertice = i;
      }

    visitado[prox_vertice] = 1;
    for (i = 0; i < n; i++)
      if (visitado[i]==0)
        if (mindistancia + costo[prox_vertice][i] < distancia[i]) {
          distancia[i] = mindistancia + costo[prox_vertice][i];
          pred[i] = prox_vertice;
        }
    cont++;
  }

  // Muestro la distancia
  for (i = 0; i < n; i++)
    if (i != comienzo) {
      printf("\nDistancia de punto de partida al v%crtice %d: %d", 130, i, distancia[i]);
    }
}
int main() {
  int grafo[MAX][MAX], peso, n, u, i, j; //n es el numero de vertices y u es el vertice de donde partimos
  printf("Ingrese la cantidad de v%crtices que van a evaluarse\n",130);
  scanf("%d",&n);
  
  //Cargo manualmente la distancia entre los vertices
  for ( i = 0; i < n; i++)
  {
    for (j = 0; j < n; j++)
    {
      if (i==j)
      {
        peso == 0;
      }
      else
      {
        printf("\nIngrese la distancia entre los v%crtices %d y %d\nEn caso de no ser adyacentes, ingrese un cero\n", 130, i, j);
        scanf("%d",&peso);
        while (peso<0)
        {
          printf("La distancia entre dos v%crtices no puede ser menor a cero\n",130);
          scanf("%d",&peso);
        } 
      }
      grafo[i][j] = peso;
    }
  }

  printf("Seleccione desde que v%crtice desea calcular las distancias m%cnimas (de 0 a %d):\n",130, 161, n-1);
  scanf("%d",&u);
  while (u<0 || u>=n)
  {
    printf("La opci%cn de v%crtice no es correcta\n",162, 130);
    scanf("%d",&u);
  }
  
  Dijkstra(grafo, n, u);

  return 0;
}