import 'package:flutter/material.dart';
import 'cod2.dart'; // Importa la segunda ventana

class Cod1 extends StatefulWidget {
  @override
  State<Cod1> createState() => _Cod1State();
}

class _Cod1State extends State<Cod1> {
  // Controlador para la caja de texto de edad
  TextEditingController campoEdad = TextEditingController();

  // Variables para la sección inferior (color del círculo y texto)
  Color colorCirculo = Colors.grey;
  String mensaje = "Esperando ingreso...";

  // 1. Requisito: Validar si la caja está vacía (.length == 0)
  void validar() {
    String texto = campoEdad.text.trim();

    if (texto.length == 0) {
      setState(() {
        colorCirculo = Colors.red;
        mensaje = "Campo obligatorio";
      });
    } else {
      mostrarAlerta(texto); // Si tiene texto, abre la alerta
    }
  }

  // 2. Alerta modal que evalúa si es número y si es mayor a 18
  void mostrarAlerta(String textoIngresado) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Validar"),
        content: Text("¿Procesar edad?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cierra la alerta

              // Convierte texto a número (devuelve null si es texto)
              int? edad = int.tryParse(textoIngresado);

              // Valida si es número válido y >= 18
              if (edad != null && edad >= 18) {
                setState(() {
                  colorCirculo = Colors.green;
                  mensaje = "Acceso Permitido";
                });
                // Navega a Cod2 pasando la edad
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cod2(edad: edad)),
                );
              } else {
                // Si es menor de 18 o no es número, muestra error en Pantalla 1
                setState(() {
                  colorCirculo = Colors.red;
                  mensaje = "Edad no válida o menor a 18";
                });
              }
            },
            child: Text("Aceptar"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cod1')),
      body: Column(
        children: [
          // SECCIÓN 1 (50% Superior)
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20), // Margen de 20px
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(controller: campoEdad),
                      ElevatedButton(
                        onPressed: validar,
                        child: Text("Ingresar"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // SECCIÓN 2 (50% Inferior)
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container circular que cambia de color
                  Container(//
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: colorCirculo,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 10),//
                  Text(
                    mensaje,
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}