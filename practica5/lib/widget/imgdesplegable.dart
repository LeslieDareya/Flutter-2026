import 'package:flutter/material.dart';

class Imgdesplegable extends StatefulWidget {
  const Imgdesplegable({super.key});

  @override
  State createState() {
    return Imagenes();
  }
}

class Imagenes extends State {
  // Variable para guardar la ruta de la imagen activa
  String imagenSeleccionada = "assets/kitty.png";

  void cambiarImagen(String? nuevaSeleccion) {
    if (nuevaSeleccion != null) {
      setState(() {
        imagenSeleccionada = nuevaSeleccion;
      });

      // Muestra la notificación flotante
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Imagen cambiada a: $nuevaSeleccion"),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visor de Imágenes'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Contenedor que muestra solo la imagen seleccionada con sombra
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
                imagenSeleccionada,
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 30),

            // Menú desplegable para cambiar la imagen
            DropdownButtonFormField(
              value: imagenSeleccionada,
              decoration: const InputDecoration(
                labelText: "Elige una imagen",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'assets/kitty.png',
                  child: Text('Kitty'),
                ),
                DropdownMenuItem(
                  value: 'assets/pom.jpg',
                  child: Text('Pom'),
                ),
                DropdownMenuItem(
                  value: 'assets/kuromi.jpg',
                  child: Text('Kuromi'),
                ),
              ],
              onChanged: (value) {
                cambiarImagen(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}