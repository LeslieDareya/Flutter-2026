// Importación del paquete principal de Flutter para componentes visuales de Material Design
import 'package:flutter/material.dart';

// Definición de un widget con estado (StatefulWidget) llamado Desplegable
class Desplegable extends StatefulWidget {
  @override
  // Crea e inicializa el estado mutable asociado invocando a la clase Clases
  State createState() {
    return Clases();
  }
}

// Clase de estado Clases que maneja la lógica de las operaciones y la UI de Desplegable
class Clases extends State {
  // Controladores para capturar el texto de los campos numéricos
  final TextEditingController n1 = TextEditingController();
  final TextEditingController n2 = TextEditingController();

  // Variables para guardar el resultado (r) y la operación seleccionada (oper)
  String r = "", oper = "";

  // Función encargada de realizar el cálculo matemático según la opción elegida
  void Operaciones() {
    // Parsea los textos ingresados a enteros; asigna 0 por defecto si no son válidos
    final int a = int.tryParse(n1.text) ?? 0;
    final int b = int.tryParse(n2.text) ?? 0;

    // Actualiza el estado y ejecuta el bloque lógico correspondiente
    setState(() {
      print("Oper: " + oper);

      // Evaluación de la operación seleccionada
      if (oper == "Suma") {
        r = "${a + b}";
      }
      if (oper == "Resta") {
        r = "${a - b}";
      }
      if (oper == "Multiplicación") {
        r = "${a * b}";
      }
      if (oper == "División") {
        r = "${a / b}";
      }

      // Muestra una barra de notificación emergente (SnackBar) con el resultado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("El resultado:" + r)),
      );
    });
  }

  @override
  // Método build que construye la jerarquía de widgets en pantalla
  Widget build(BuildContext context) {
    // Estructura visual básica de la pantalla
    return Scaffold(
      // Color de fondo gris
      backgroundColor: Colors.grey,
      // Barra superior con sombra y estilo personalizado
      appBar: AppBar(
        title: Text('Suma de dos numeros'),
        backgroundColor: const Color.fromARGB(255, 192, 214, 240),
        elevation: 10,
        shadowColor: Colors.indigoAccent,
      ),
      // Cuerpo principal centrado
      body: Center(
        // Tarjeta contenedor con sombreado y bordes suavemente redondeados
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 15,
          shadowColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20),
            // Alineación de los elementos en columna
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Título de la interfaz
                Text(
                  'Ingresa los datos a sumar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 15),

                // Campo de entrada para el primer número
                TextField(
                  controller: n1,
                  decoration: InputDecoration(
                    labelText: "Escribe un numero",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.amp_stories),
                  ),
                ),
                SizedBox(height: 15),

                // Campo de entrada para el segundo número
                TextField(
                  controller: n2,
                  decoration: InputDecoration(
                    labelText: "Escribe otro numero",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.amp_stories),
                  ),
                ),
                SizedBox(height: 20),

                /*Text(r,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                ),*/

                // Menú desplegable dentro de un formulario para seleccionar la operación
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Elige la operación",
                    border: OutlineInputBorder(),
                  ),
                  // Opciones disponibles en el menú desplegable
                  items: [
                    DropdownMenuItem(value: 'Suma', child: Text('Suma')),
                    DropdownMenuItem(value: 'Resta', child: Text('Resta')),
                    DropdownMenuItem(
                        value: 'Multiplicación',
                        child: Text('Multiplicación')),
                    DropdownMenuItem(
                        value: 'División', child: Text('División')),
                  ],
                  // Asigna el valor elegido a la variable 'oper' al cambiar la opción
                  onChanged: (value) => oper = value!,
                  // Validación opcional para verificar que no esté nulo
                  validator: (v) =>
                      v == null ? "Elige una operacion" : null,
                ),
                SizedBox(height: 20),

                // Botón expandido para ejecutar la función de cálculo
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.summarize),
                    onPressed: Operaciones, // Llama al método Operaciones al presionar
                    label: Text(
                      'Realizar operación',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}