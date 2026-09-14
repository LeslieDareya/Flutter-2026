// Importación del paquete básico de Flutter para interfaz de usuario Material Design
import 'package:flutter/material.dart';
// Importación adicional de widgets generales
import 'package:flutter/widgets.dart';

// Definición de un widget con estado (StatefulWidget) llamado suma
class suma extends StatefulWidget {
  @override
  // Crea e inicializa el estado mutable asociado llamando a la clase Disenio
  State createState() {
    return Disenio();
  }
}

// Clase de estado Disenio que maneja la lógica de la suma y la interfaz gráfica
class Disenio extends State {
  // Controladores para capturar el texto ingresado en los dos campos de entrada
  final TextEditingController n1 = TextEditingController();
  final TextEditingController n2 = TextEditingController();

  // Variable de estado que guarda el resultado de la suma para mostrar en pantalla
  String r = "";

  @override
  // Método build que construye el árbol de widgets visuales
  Widget build(Object context) {
    // Estructura base de la pantalla
    return Scaffold(
      // Color de fondo gris para toda la pantalla
      backgroundColor: Colors.grey,
      // Barra superior de la aplicación
      appBar: AppBar(
        title: Text("Suma de dos numeros"),
        backgroundColor: const Color.fromARGB(255, 192, 214, 240),
        elevation: 15,
        shadowColor: Colors.indigoAccent,
      ),

      // Cuerpo de la pantalla centrado
      body: Center(
        // Tarjeta contenedor con sombreado y bordes redondeados
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 15,
          shadowColor: Colors.white,

          // Margen interno dentro de la tarjeta
          child: Padding(
            padding: EdgeInsets.all(5),
            // Organización vertical del contenido
            child: Column(
              children: [
                // Título descriptivo para el usuario
                Text('Ingresa los datos a sumar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    )),

                SizedBox(height: 15),

                // Primer campo para ingresar el número 1
                TextField(
                  controller: n1,
                  decoration: InputDecoration(
                      labelText: "Escribe un numero",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.amp_stories)),
                ),

                SizedBox(height: 15),

                // Segundo campo para ingresar el número 2
                TextField(
                  controller: n2,
                  decoration: InputDecoration(
                      labelText: "Escribe otro numero",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.amp_stories)),
                ),

                SizedBox(
                  height: 20,
                ),

                // Muestra la variable 'r' con el resultado obtenido de la suma
                Text(r,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    )),

                SizedBox(
                  height: 20,
                ),

                // Botón expandido al ancho disponible para procesar la suma
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.summarize),
                    onPressed: () {
                      // Convierte los textos ingresados a enteros (usa 0 si no son válidos)
                      final int a = int.tryParse(n1.text) ?? 0;
                      final int b = int.tryParse(n2.text) ?? 0;
                      // Actualiza el estado asignando el resultado concatenado a la variable 'r'
                      setState(() {
                        r = "${a + b}";
                      });
                    },
                    label: Text('Sumar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}