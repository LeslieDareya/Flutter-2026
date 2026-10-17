import 'package:flutter/material.dart';

// Segunda pantalla. Es StatelessWidget porque aquí solo se MUESTRAN los datos,
// Second screen. It is a StatelessWidget because data is only DISPLAYED here,
// no cambian dentro de esta pantalla (no necesitamos setState)
// it doesn't change inside this screen (no need for setState)
class Filtro extends StatelessWidget {
  // Lista de pares que llega desde la pantalla principal
  // List of even numbers coming from the main screen
  final List<int> pares;

  // Lista de impares que llega desde la pantalla principal
  // List of odd numbers coming from the main screen
  final List<int> impares;

  // Constructor con parámetros con nombre ({ }) y obligatorios (required)
  // Constructor with named ({ }) and required parameters
  // "this.pares" significa: guarda lo que me manden en mi variable "pares"
  // "this.pares" means: save what is sent to me into my "pares" variable
  const Filtro({
    super.key,
    required this.pares,
    required this.impares,
  });

  // build dibuja la pantalla
  // build draws the screen
  @override
  Widget build(BuildContext context) {
    // Esqueleto de la pantalla
    // Screen skeleton
    return Scaffold(
      // Barra superior (Flutter agrega solo la flecha para regresar)
      // Top app bar (Flutter automatically adds the back arrow)
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 158, 66), // mismo color que la principal / same color as the main one
        title: const Text('Pares e impares'), // título de la barra / bar title
      ),
      // Padding da espacio alrededor del contenido
      // Padding gives space around the content
      body: Padding(
        padding: const EdgeInsets.all(15),
        // Row acomoda sus hijos uno al lado del otro (horizontal)
        // Row arranges its children side by side (horizontal)
        child: Row(
          // Alinea los hijos arriba
          // Aligns children at the top
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded hace que este hijo use la mitad del ancho disponible
            // Expanded makes this child use half of the available width
            Expanded(
              // Columna de PARES: título arriba y lista abajo
              // EVEN Column: title at the top and list at the bottom
              child: Column(
                children: [
                  // Título de la columna
                  // Column title
                  const Text(
                    'Pares',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10), // espacio pequeño / small space
                  // Expanded para que la lista use el alto que queda (si no, da error)
                  // Expanded so the list uses the remaining height (otherwise, it throws an error)
                  Expanded(
                    // ListView.builder crea una lista con scroll, una fila por elemento
                    // ListView.builder creates a scrollable list, one row per item
                    child: ListView.builder(
                      itemCount: pares.length, // cuántas filas hay / how many rows there are
                      // itemBuilder se llama una vez por fila; "index" empieza en 0
                      // itemBuilder is called once per row; "index" starts at 0
                      itemBuilder: (context, index) {
                        // Card: tarjeta con sombra
                        // Card: card with shadow
                        return Card(
                          // ListTile: fila prediseñada
                          // ListTile: pre-designed row
                          child: ListTile(
                            // pares[index] es el número de esta fila; ".toString()" lo vuelve texto
                            // pares[index] is the number of this row; ".toString()" converts it to text
                            title: Text(pares[index].toString()),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Espacio horizontal entre las两 columnas
            // Horizontal space between the two columns
            const SizedBox(width: 15),
            // Segundo Expanded: la otra mitad del ancho
            // Second Expanded: the other half of the width
            Expanded(
              // Columna de IMPARES: igual que la de arriba pero con la otra lista
              // ODD Column: same as above but with the other list
              child: Column(
                children: [
                  const Text(
                    'Impares',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: impares.length, // cantidad de impares / quantity of odds
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(impares[index].toString()), // número impar de esta fila / odd number of this row
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}