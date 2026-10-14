import 'package:flutter/material.dart';
import 'package:practica7/detector/ventana1.dart';
import 'package:practica7/detector/ventana2.dart';
import 'package:practica7/mayoredad/cod1.dart';
import 'package:practica7/mayoredad/cod2.dart';
import 'package:practica7/preexamen/principal.dart';
import 'package:practica7/preexamen/segunda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cod1(),
    );
  }
}