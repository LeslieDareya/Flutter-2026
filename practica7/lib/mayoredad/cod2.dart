import 'package:flutter/material.dart';

class Cod2 extends StatelessWidget {
  final int edad; // Parámetro recibido desde Cod1

  const Cod2({super.key, required this.edad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cod2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen ubicada ARRIBA del resultado
            Image.asset(
              'assets/mayor.jpg',
              width: 120,
              height: 120,
              // Evita fallos si no agregaste la imagen al pubspec.yaml
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.person, size: 100, color: Colors.green),
            ),
            SizedBox(height: 15),
            Text(
              "¡Acceso Concedido!",
              style: TextStyle(fontSize: 26, color: Colors.blue),
            ),
            Text("Edad: $edad años", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}