import 'package:flutter/material.dart';
import 'package:practica5/widget/btnimagen.dart';
import 'package:practica5/widget/imgdesplegable.dart';
import 'package:practica5/widget/mostrarimagenes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MostrarImagenes(),
    ); // MaterialApp
  }
}