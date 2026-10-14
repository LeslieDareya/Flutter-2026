import 'package:flutter/material.dart';

class Lista1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Clase2();
  }
}
class Item{
  final String titulo;
  final String subtitulo;
  Item(this.titulo, this.subtitulo);
}
class Clase2 extends State<Lista1>{
  final List <Item> items = [
    Item('Jabon','120.00'),
    Item('Agua','10.00'),
    Item('Sal','20.00'),
    Item('Arina','150.00'),
    Item('Refresco','200.00'),
 
  ];
  @override
  widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.indigoAccent,
      title: Text(
        'Practica de listas'
        style: TextStyle(
          color: Colors.white,
        ),
      ),
        );
      body: ListView.builder(
        itemCount: items.length,
        itemBuildwe:
        itemCount: 25,
        itemBuilder: (context, index) => Card,
        child: ListTile(
          leading: Icons.add_alert),
         // title: Text('Lista'),
          //subtitle: Text('Subtitulo columna'),
          title: Text(items[items''])
           tralling: Icon(Icons.ac_unit),


          )

      
   
  }
}