import 'package:flutter/material.dart';

class Lista2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Clase2();
  }
}

class Item {
  final String titulo;
  final String subtitulo;
  Item(this.titulo, this.subtitulo);
}

class Clase2 extends State<Lista2> {
  final List<Item> items = [
    Item('Jabon', '120.00'),
    Item('Agua', '10.00'),
    Item('Sal', '20.00'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          'Practica de listas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(2),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Escribe el producto'),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Escribe el Precio'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        leading: Icon(Icons.add_alert),
                        title: Text(items[index].titulo),
                        subtitle: Text(items[index].subtitulo),
                        trailing: Icon(Icons.airline_seat_flat_angled_outlined),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}