// Importa el paquete principal de Flutter que contiene los widgets de Material Design
import 'package:flutter/material.dart';

// Definición de un StatefulWidget llamado 'Lista1' que permite manejar estado dinámico
class Lista1 extends StatefulWidget {
  @override
  State createState() {
    // Retorna la instancia del estado asociado a este widget
    return Clase2();
  }
}

// Clase modelo sencilla para estructurar los datos de cada elemento de la lista
class Item{
  final String titulo; // Propiedad final para el título del ítem
  final String subtitulo; // Propiedad final para el subtítulo (precio) del ítem
  Item(this.titulo, this.subtitulo); // Constructor que inicializa ambas propiedades
}

// Clase de estado 'Clase2' que extiende de State para el widget Lista1
class Clase2 extends State<Lista1> {
  // Lista privada de objetos tipo 'Item' con productos y sus precios simulados
  final List <Item> items = [
   Item('Jabon', '120.00'),
   Item('Agua', '12.00'),
   Item('Sal', '100.00'),
   Item('Arina', '150.00'),
   Item('Refresco', '200.00'),
  ];
 
  
  @override
  Widget build(BuildContext context) {
    // Retorna un Scaffold que provee la estructura visual básica de la interfaz
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent, // Color de fondo de la barra superior
        title: Text(
          'Practica de listas', // Texto que se muestra en la barra superior
          style: TextStyle(
            color: Colors.white, // Color blanco para el texto del título
          )
        ),
      ), // AppBar

      // Widget ListView.builder para generar una lista eficiente basada en elementos dinámicos
      body: ListView.builder(
        itemCount: items.length, // Define la cantidad total de elementos que tendrá la lista
        itemBuilder: (context, index) =>Card( // Crea una tarjeta (Card) visual para cada elemento
          child: ListTile(
            leading: Icon(Icons.access_alarm_outlined), // Icono decorativo al inicio (izquierda) del ListTile
            
            title: Text(items[index].titulo), // Muestra el título dinámico obtenido del objeto actual en la lista
            subtitle: Text(items[index].subtitulo), // Muestra el subtítulo (precio) dinámico del objeto actual
            trailing: Icon(Icons.ac_unit), // Icono decorativo al final (derecha) del ListTile
      ), // ListTile
    ), // Card
  ), // ListView.builder
    );
  }
  }