// Importación del paquete principal de Flutter para utilizar componentes de Material Design
import 'package:flutter/material.dart';

// Definición del widget con estado (StatefulWidget) llamado Sumass
class Sumass extends StatefulWidget {
  @override
  // Crea e instancia el estado mutable de este widget apuntando a la clase Disenio
  State createState() {
    return Disenio();
  }
}

// Clase de estado Disenio que maneja la lógica de las operaciones y la interfaz gráfica de Sumass
class Disenio extends State {
  // Controladores de texto para capturar y manipular las entradas numéricas del usuario
  final TextEditingController n1 = TextEditingController();
  final TextEditingController n2 = TextEditingController();

  // Variable de estado de tipo String para almacenar y actualizar la respuesta de la operación en pantalla
  String r = "";

  @override
  // Método del ciclo de vida que se ejecuta al destruir el widget para liberar memoria cancelando los controladores
  void dispose() {
    n1.dispose();
    n2.dispose();
    super.dispose();
  }

  @override
  // Método build encargados de definir la estructura visual y distribución de componentes
  Widget build(BuildContext context) {
    // Estructura principal de la pantalla con soporte para barra de navegación y cuerpo
    return Scaffold(
      // Color de fondo gris claro para toda la pantalla
      backgroundColor: Colors.grey[300],
      // Barra superior de la aplicación
      appBar: AppBar(
        title: Text("Operaciones Básicas"),
        backgroundColor: const Color.fromARGB(255, 192, 214, 240),
        elevation: 15,
        shadowColor: Colors.indigoAccent,
      ),
      // Cuerpo centrado en pantalla
      body: Center(
        // Permite la navegación por desplazamiento (scroll) vertical si los elementos rebasan el tamaño de pantalla
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          // Tarjeta con diseño elevado y bordes suavizados para envolver el formulario
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            shadowColor: Colors.white,
            // Margen interno general de 16 píxeles alrededor de los widgets hijos
            child: Padding(
              padding: EdgeInsets.all(16),
              // Columna de elementos adaptada al tamaño mínimo necesario
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Título descriptivo superior con estilo personalizado
                  Text(
                    'Ingresa los datos',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),

                  SizedBox(height: 15),

                  // Primer campo de texto para ingresar números con icono informativo al inicio
                  TextField(
                    controller: n1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Escribe un número",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),

                  SizedBox(height: 15),

                  // Segundo campo de texto numérico
                  TextField(
                    controller: n2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Escribe otro número",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Texto interactivo que renderiza el valor actual guardado en 'r'
                  Text(
                    "Resultado: $r",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Botón ocupando todo el ancho disponible para calcular la suma
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        // Parsea las cadenas ingresadas a int; asigna valor por defecto de 0 si hay campos vacíos o texto no numérico
                        final int a = int.tryParse(n1.text) ?? 0;
                        final int b = int.tryParse(n2.text) ?? 0;
                        // Notifica al framework el cambio de valor en 'r' para redibujar la UI con la suma
                        setState(() {
                          r = "${a + b}";
                        });
                      },
                      label: Text(
                        'Sumar',
                        style: TextStyle(fontSize: 18, color: Colors.indigo),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Botón expandido para realizar el cálculo de la resta
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        final int a = int.tryParse(n1.text) ?? 0;
                        final int b = int.tryParse(n2.text) ?? 0;
                        setState(() {
                          r = "${a - b}";
                        });
                      },
                      label: Text(
                        'Restar',
                        style: TextStyle(fontSize: 18, color: Colors.indigo),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Botón expandido para realizar el cálculo de la multiplicación
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        final int a = int.tryParse(n1.text) ?? 0;
                        final int b = int.tryParse(n2.text) ?? 0;
                        setState(() {
                          r = "${a * b}";
                        });
                      },
                      label: Text(
                        'Multiplicar',
                        style: TextStyle(fontSize: 18, color: Colors.indigo),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Botón expandido para realizar la división entera
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.horizontal_rule),
                      onPressed: () {
                        final int a = int.tryParse(n1.text) ?? 0;
                        final int b = int.tryParse(n2.text) ?? 0;
                        // Evaluador ternario que previene división sobre 0 asignando un texto de error o la división truncada (~/)
                        setState(() {
                          r = b == 0 ? "Error (/0)" : "${a ~/ b}";
                        });
                      },
                      label: Text(
                        'Dividir',
                        style: TextStyle(fontSize: 18, color: Colors.indigo),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}