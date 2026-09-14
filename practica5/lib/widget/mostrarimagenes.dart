// Importación del paquete principal de Flutter para componentes visuales de Material Design
import 'package:flutter/material.dart';

// Definición de un widget con estado (StatefulWidget) llamado MostrarImagenes
class MostrarImagenes extends StatefulWidget {
  // Constructor constante con super.key para la identificación del widget
  const MostrarImagenes({super.key});

  @override
  // Crea e inicializa el estado mutable asociado invocando a la clase Imagenes
  State createState() {
    return Imagenes();
  }
}

// Clase de estado Imagenes que contiene la interfaz visual de la galería
class Imagenes extends State {
  @override
  // Método build que construye la estructura de la pantalla y sus elementos
  Widget build(BuildContext context) {
    // Scaffold provee la estructura básica de la pantalla (AppBar, body, etc.)
    return Scaffold(
      // Barra superior con título centrado en el tema visual y color de fondo rojo claro
      appBar: AppBar(
        title: const Text('Imagenes'),
        backgroundColor: Colors.redAccent,
      ),
      // Cuerpo organizado de forma vertical
      body: Column(
        children: [
          // Contenedor principal que fija el alto de la lista desplegable de imágenes a 500px
          Container(
            width: double.infinity,
            height: 500,
            // Centra el contenido dentro del contenedor
            child: Center(
              // Habilita el desplazamiento (scroll) vertical si los elementos sobrepasan los 500px de altura
              child: SingleChildScrollView(
                // Alinea las imágenes en una columna vertical centrada
                child: Column(
                  children: [
                    // Aplicación de sombra y decoración a la primera imagen (kitty.png)
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Sombra suave en negro semi-transparente
                            blurRadius: 10,       // Difuminado de la sombra
                            offset: Offset(0, 4), // Desplazamiento vertical de la sombra
                          ),
                        ],
                      ),
                      // Renderizado del recurso de imagen local desde la carpeta assets
                      child: Image.asset(
                        "assets/kitty.png",
                        width: 300,
                        fit: BoxFit.contain, // Mantiene la proporción de la imagen sin recortar
                      ),
                    ),

                    // Espaciador vertical constante de 20 píxeles entre imágenes
                    const SizedBox(height: 20),

                    // Aplicación de sombra y decoración a la segunda imagen (pom.jpg)
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/pom.jpg",
                        width: 300,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Espaciador vertical constante de 20 píxeles entre imágenes
                    const SizedBox(height: 20),

                    // Aplicación de sombra y decoración a la tercera imagen (kuromi.jpg)
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/kuromi.jpg",
                        width: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}