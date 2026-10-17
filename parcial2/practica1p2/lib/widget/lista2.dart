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
  // Controladores de texto para capturar lo que el usuario escribe en los inputs de producto y precio
  TextEditingController producto = TextEditingController();
  TextEditingController precio = TextEditingController();

  // Lista inicial que almacena objetos de tipo Item con los productos precargados
  final List<Item> items = [
    Item('Jabon', '\$120.00'),
    Item('Agua', '\$10.00'),
  ];
  
  // Función para mostrar una ventana emergente (AlertDialog personalizado) al hacer clic en un elemento de la lista
  void _MostrarDatos(String nombre, String precioindex){
    print(nombre +precioindex);
    showDialog(
    context: context,
    builder: (BuildContext context){
      return Dialog(
        backgroundColor: Colors.transparent, // Fondo transparente para dar estilo personalizado al contenedor
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15), // Bordes redondeados para el diálogo
          ),
         child: Column(
            mainAxisSize: MainAxisSize.min, // Se ajusta al tamaño mínimo del contenido interno
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle, // Contenedor circular gris
                ), 
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.blue,
                  size: 40,
                ), // Icon
              ), 
              SizedBox(height: 10),
              Text(nombre, // Muestra el título del producto seleccionado
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
               ),
              ),
              SizedBox(height: 10),
              Text(precioindex, // Muestra el precio del producto seleccionado
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
                      Navigator.pop(context); // Cierra la ventana emergente actual
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

  // Función para agregar un nuevo elemento a la lista a partir de los campos de texto
  void _agregar() {
    String p = producto.text;
    String pr = precio.text;

      if(p.isNotEmpty && pr.isNotEmpty){ // Valida que los campos no estén vacíos antes de insertar
        setState((){
          items.insert(
            0, Item(p, '\$$pr'), // Inserta el nuevo item al principio de la lista con formato de precio
          );
        });
        producto.clear(); // Limpia el campo de texto del producto
        precio.clear(); // Limpia el campo de texto del precio

      }else{
        // Muestra un mensaje flotante (SnackBar) si algún campo está vacío
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
    // Retorna la estructura principal de la pantalla mediante un Scaffold
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          'Practica de listas',
          style: TextStyle(color: Colors.white),
        ),
       actions: [ /// Elementos adicionales ubicados en la parte derecha del AppBar
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
              '${items.length} productos', // Muestra el contador dinámico del total de productos en tiempo real
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
                  elevation: 8, // Sombra de la tarjeta contenedora del formulario
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: producto, // Controlador para el input del nombre del producto
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
                          onPressed: _agregar, // Llama a la función _agregar al presionar el botón
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
                    itemCount: items.length, // Define la longitud total de la lista basada en los elementos actuales
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        leading: Icon(Icons.add_alert), // Icono decorativo a la izquierda
                        title: Text(items[index].titulo), // Muestra el título del ítem actual
                        subtitle: Text(items[index].subtitulo), // Muestra el subtítulo (precio) del ítem actual
                        trailing: Icon(Icons.airline_seat_flat_angled_outlined), // Icono decorativo a la derecha
                        onTap: (){// Detecta los clics dentro de cada elemento de la lista
                          _MostrarDatos(items[index].titulo, items[index].subtitulo); // Llama al diálogo con los datos del elemento seleccionado

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