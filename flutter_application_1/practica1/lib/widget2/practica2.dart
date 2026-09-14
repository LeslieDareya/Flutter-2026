// Importación del paquete principal de Flutter para componentes visuales de Material Design
import 'package:flutter/material.dart';

// Definición de un widget con estado (StatefulWidget) llamado practica2
class practica2 extends StatefulWidget {
  @override
  // Crea e inicializa el estado mutable asociado llamando a la clase Disenio
  State createState() {
    return Disenio();
  }
}

// Clase de estado Disenio que construye la interfaz gráfica de practica2
class Disenio extends State {
  @override
  // Método build que genera el árbol de widgets de la pantalla
  Widget build(BuildContext context) {
    // Estructura visual base de la pantalla (Scaffold)
    return Scaffold(
      // Barra superior de navegación de la aplicación
      appBar: AppBar(
        // Título de la barra con texto en color blanco
        title: Text(
          'Practica 2',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // Color azul de la barra superior definido mediante valores ARGB
        backgroundColor: const Color.fromARGB(255, 220, 31, 31),
      ),
      // Contenedores: Organización vertical del contenido central
      body: Column(
        // Centra verticalmente todos los elementos secundarios en la pantalla
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Primer contenedor con fondo negro que ocupa todo el ancho disponible
          Container(
            color: Colors.black,
            width: double.infinity,
            // Texto centrado con tipografía de estilo "Time New Roman" y color blanco
            child: Text(
              'Hola Mundo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Time New Roman",
                fontSize: 24,
              ),
            ),
          ),
          // Segundo contenedor con relleno interior (padding) de 25px y fondo rojo
          Container(
            padding: EdgeInsets.all(25),
            color: const Color.fromARGB(255, 236, 4, 4),
            width: double.infinity,
            // Texto centrado dentro del contenedor rojo
            child: Text(
              'Hola',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Time New Roman",
                fontSize: 24,
              ),
            ),
          ),
          // Espaciador vertical transparente con una altura de 10px
          SizedBox(
            height: 10,
          ),

          // Contenedor que expande el botón a todo el ancho disponible
          Container(
            width: double.infinity,
            // Botón interactivo básico elevado
            child: ElevatedButton(
              // Acción al presionar el botón (actualmente vacía)
              onPressed: () {},
              child: Text('Boton'),
            ),
          ),
          // Campo de entrada de texto con borde completo y etiqueta descriptiva
          TextField(
            decoration: InputDecoration(
              labelText: 'Escribe el nombre',
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}