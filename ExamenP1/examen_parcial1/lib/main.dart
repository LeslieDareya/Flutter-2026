import 'package:examen_parcial1/examenp1/pagina2.dart';
import 'package:examen_parcial1/examenp1/pagina3.dart';

import 'package:examen_parcial1/examenp1/principal.dart';
import 'package:flutter/material.dart';


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
    );
  }
}