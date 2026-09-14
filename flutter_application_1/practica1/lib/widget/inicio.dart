// Importación del paquete de Flutter para widgets basados en Material Design
import 'package:flutter/material.dart';

// Definición de un widget con estado (StatefulWidget) llamado practica1
class practica1 extends StatefulWidget {
  @override
  // Crea e inicializa el estado asociado a esta clase invocando al estado Disenio
  State createState() {
    return Disenio();
  }
}

// Clase de estado Disenio que define la estructura lógica y visual de practica1
class Disenio extends State {
  @override
  // Método que construye los widgets que conforman la interfaz gráfica
  Widget build(BuildContext context) {
    // Estructura visual básica de la pantalla (Scaffold)
    return Scaffold(
      // Barra superior de la aplicación
      appBar: AppBar(
        // Título desplegado en la barra superior con estilo de texto en color blanco
        title: Text(
          'Practica 1',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // Color de fondo azul de la barra superior usando componentes ARGB
        backgroundColor: const Color.fromARGB(255, 6, 79, 238),
      ),
      // Cuerpo principal de la pantalla basado en una vista vertical
      body: Column(
        // Centra verticalmente los elementos secundarios dentro de la columna
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Primer elemento de texto mostrado en pantalla
          Text(
            'Hola mundo',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 25,
            ),
          ),
          // Segundo elemento de texto ubicado debajo del primero
          Text(
            'Hola',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}