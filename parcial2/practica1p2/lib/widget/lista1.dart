import 'package:flutter/material.dart';

class Lista1 extends StatefulWidget {
  @override
  State createState() {
    return Clase2();
  }
}
class Item{
  final String titulo;
  final String subtitulo;
  Item(this.titulo, this.subtitulo);
}
class Clase2 extends State<Lista1> {
  final List <Item> items = [
   Item('Jabon', '120.00'),
   Item('Agua', '12.00'),
   Item('Sal', '100.00'),
   Item('Arina', '150.00'),
   Item('Refresco', '200.00'),
  ];
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          'Practica de listas',
          style: TextStyle(
            color: Colors.white,
          )
        ),
      ), // AppBar

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) =>Card(
          child: ListTile(
            leading: Icon(Icons.access_alarm_outlined), // izquierda obligatorio en una lista
           /* title: Text('Lista'), // Column // obligatorio en una lista
            subtitle: Text('Subtitulo de la lista'),*/
           
            title: Text(items[index].titulo), // Column // obligatorio en una lista
            subtitle: Text(items[index].subtitulo),
            trailing: Icon(Icons.ac_unit),
      ), // ListTile
    ), // Card
  ), // ListView.builder
    );
  }
  }



