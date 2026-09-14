import 'package:flutter/material.dart';
import 'package:practica1/oparitmeticas/practica4.dart';
import 'package:practica1/opcion2/desplegable.dart';
import 'package:practica1/operaciones/suma.dart';
import 'package:practica1/widget/inicio.dart';
import 'package:practica1/widget2/practica2.dart';

// Punto de entrada principal para ejecutar la aplicación en Flutter
void main() {
  // Inicializa el árbol de widgets inflando la clase principal MyApp
  runApp(const MyApp());
}

// Widget de tipo StatelessWidget que representa el nodo raíz de la aplicación
class MyApp extends StatelessWidget {
  // Constructor constante que hereda la clave (Key) opcional para la gestión de widgets
  const MyApp({super.key});

  @override
  // Método build que construye e inicializa la configuración general de la interfaz
  Widget build(BuildContext context) {
    // Retorna la envoltura global de Material Design para navegación, temas y diseño general
    return MaterialApp(
      // Establece la pantalla 'Desplegable' como la vista inicial por defecto de la aplicación
      home: Desplegable(),
    );
  }
}