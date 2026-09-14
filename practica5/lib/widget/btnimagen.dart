import 'package:flutter/material.dart';

class Btnimagen extends StatefulWidget {
  const Btnimagen({super.key});

  @override
  State createState() {
    return Imagenes();
  }
}

class Imagenes extends State {
  // Variable para guardar la ruta de la imagen activa
  String imagenSeleccionada = "assets/kitty.png";

  void cambiarImagen(String nuevaRuta, String nombre) {
    setState(() {
      imagenSeleccionada = nuevaRuta;
    });

    // Muestra la notificación flotante
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Imagen cambiada a: $nombre"),
        duration: const Duration(seconds: 1),
      ),
    );
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
            // Contenedor que muestra la imagen seleccionada con sombra
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

            const SizedBox(height: 40),

            // Botones para cambiar la imagen
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => cambiarImagen("assets/kitty.png", "Kitty"),
                  child: const Text('Kitty'),
                ),
                ElevatedButton(
                  onPressed: () => cambiarImagen("assets/pom.jpg", "Pom"),
                  child: const Text('Pom'),
                ),
                ElevatedButton(
                  onPressed: () => cambiarImagen("assets/kuromi.jpg", "Kuromi"),
                  child: const Text('Kuromi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}