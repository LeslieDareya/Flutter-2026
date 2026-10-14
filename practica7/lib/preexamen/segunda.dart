import 'package:flutter/material.dart';

// Widget StatelessWidget: Se usa porque esta pantalla solo mostrará un valor recibido y no cambiará
class Segunda extends StatelessWidget {
  // Variable final para almacenar el dato que nos envían desde la pantalla principal
  final String valorEnviado;

  // Constructor que recibe de manera obligatoria (required) el parámetro valorEnviado
  const Segunda({super.key, required this.valorEnviado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda Ventana')), // Barra superior de navegación
      // Center posiciona todo el contenido exactamente al centro de la pantalla
      body: Center(
        child: Text(
          "Número: $valorEnviado", // Despliega la variable recibida por parámetro
          style: TextStyle(fontSize: 28, color: Colors.blue),
        ),
      ),
    );
  }
}