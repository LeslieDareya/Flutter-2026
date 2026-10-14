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
  TextEditingController producto = TextEditingController();
  TextEditingController precio = TextEditingController();

  final List<Item> items = [
    Item('Jabon', '\$120.00'),
    Item('Agua', '\$10.00'),
  ];
  void _MostrarDatos(String nombre, String precioindex){
    print(nombre +precioindex);
    showDialog(
    context: context,
    builder: (BuildContext context){
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
         child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ), 
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.blue,
                  size: 40,
                ), // Icon
              ), 
              SizedBox(height: 10),
              Text(nombre,
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
               ),
              ),
              SizedBox(height: 10),
              Text(precioindex,
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
               ),
              ),
              SizedBox(height: 10),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('Cerrar',
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    )), 
        ),
      ), 
    ],// Container
  ),
  ),// Dialog
  
  );

  },
  );
  }


  void _agregar() {
    String p = producto.text;
    String pr = precio.text;

      if(p.isNotEmpty && pr.isNotEmpty){
        setState((){
          items.insert(
            0, Item(p, '\$$pr'),
          );
        });
        producto.clear();
        precio.clear();

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Producto agregado'),
            behavior: SnackBarBehavior.floating,
          ), 
        );
}   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          'Practica de listas',
          style: TextStyle(color: Colors.white),
        ),
       actions: [ ///elementos que puedo agregar en el appbar
        Padding(
          padding:EdgeInsets.only(right: 18),
          child: Center(
            child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ), // EdgeInsets.symmetric
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ), // BoxDecoration
            child: Text(
              '${items.length} productos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ), // TextStyle
            ), // Text
          ), // Container
          ), // Center
          ), // Padding
      
      ],

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
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: producto,
                        decoration: InputDecoration(
                          label: Text('Escribe el producto'),
                        ),
                      ),
                      TextField(
                        controller: precio, /// Relacionar las variables con los controladores de texto
                        decoration: InputDecoration(
                          label: Text('Escribe el Precio'),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _agregar,
                          label: Text('Agregar'),
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
                        onTap: (){//detecta los clics dentro de la lista
                          _MostrarDatos(items[index].titulo, items[index].subtitulo);

                        } 
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