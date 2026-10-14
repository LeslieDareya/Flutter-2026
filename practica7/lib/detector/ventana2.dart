import 'package:flutter/material.dart';

// Usa StatelessWidget porque solo despliega la información que recibe sin cambiar dinámicamente
class Ventana2 extends StatelessWidget {
  // Variables obligatorias que provienen de Ventana1
  final String texto;
  final String tipo;
  final int conteo;

  const Ventana2({
    super.key,
    required this.texto,
    required this.tipo,
    required this.conteo,
  });

  @override
  Widget build(BuildContext context) {
    // Selecciona la ruta de la imagen en base a la opción que llegó en el constructor
    String rutaImagen = (tipo == 'Mayúsculas')
        ? 'assets/mayuscula.png'
        : 'assets/minuscula.png';

    return Scaffold(
      appBar: AppBar(title: Text('Ventana 2')),
      body: Center( // Posiciona el contenido en el centro exacto de la pantalla
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto de bienvenida centrado
            Text(
              "El resultado es",
              style: TextStyle(fontSize: 28, color: Colors.blue),
            ),
            SizedBox(height: 10),
            Text("contiene '$texto': $conteo $tipo"),
            SizedBox(height: 20),

            
          ],
        ),
      ),
    );
  }
}