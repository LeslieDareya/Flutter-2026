import 'package:flutter/material.dart';

class Ventana1 extends StatefulWidget {
  const Ventana1({super.key});

  @override
  State<StatefulWidget> createState() => _Ventana1State();
}

class _Ventana1State extends State<Ventana1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos'),
        backgroundColor: Colors.lightGreen,
      ), // AppBar
      body: Text('Hola mundo'),
    ); // Scaffold
  }
}