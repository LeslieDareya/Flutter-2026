import 'package:flutter/material.dart';

class Item {
  final String nombre;
  final String telefono;
  final String imagen; // Se añade el campo de imagen

  Item(this.nombre, this.telefono, this.imagen);
}

class Lista2 extends StatefulWidget {
  final String nombreUsuario;

  Lista2({
    required this.nombreUsuario,
  });

  @override
  State createState() {
    return Clase2();
  }
}

// =====================================================
// CLASE 2
// =====================================================

class Clase2 extends State {

  // =====================================================
  // LISTA DE ELEMENTOS
  // =====================================================

  final List items = [
    Item(
      'Ramiro',
      '3312345678',
      'assets/ramiro.png',
    ),
    Item(
      'David',
      '3398765432',
      'assets/david.png',
    ),
    Item(
      'Sara',
      '3311122233',
      'assets/sara.png',
    ),
  ];

  // =====================================================
  // CONTROLADORES
  // =====================================================

  TextEditingController nombre = TextEditingController();
  TextEditingController telefono = TextEditingController();

  // =====================================================
  // MOSTRAR SHOWDIALOG
  // =====================================================

  void mostrarDialogo() {
    nombre.clear();
    telefono.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Agregar contacto',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ==============================
              // NOMBRE
              // ==============================
              TextField(
                controller: nombre,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              // ==============================
              // TELEFONO
              // ==============================
              TextField(
                controller: telefono,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            // ==============================
            // CANCELAR
            // ==============================
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
              ),
            ),

            // ==============================
            // AGREGAR
            // ==============================
            ElevatedButton(
              onPressed: () {
                if (nombre.text.isNotEmpty &&
                    telefono.text.isNotEmpty) {
                  setState(() {
                    items.add(
                      Item(
                        nombre.text,
                        telefono.text,
                        'assets/ramiro.png', // Imagen por defecto al agregar nuevos contactos
                      ),
                    );
                  });

                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Escribe el nombre y teléfono',
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'Agregar',
              ),
            ),
          ],
        );
      },
    );
  }

  // =====================================================
  // DISEÑO DE LA VENTANA 2
  // =====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =================================================
      // APP BAR
      // =================================================
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          'Lista de contactos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: mostrarDialogo,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),

      // =================================================
      // BODY
      // =================================================
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                // =================================================
                // IMAGEN CON FORMATO DE SOMBRA (DecoratedBox)
                // =================================================
                leading: DecoratedBox(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Sombra suave
                        blurRadius: 10,       // Difuminado
                        offset: Offset(0, 4), // Desplazamiento
                      ),
                    ],
                  ),
                  child: Image.asset(
                    items[index].imagen, // Toma la imagen del elemento actual
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                // =================================================
                // NOMBRE
                // =================================================
                title: Text(
                  items[index].nombre,
                ),

                // =================================================
                // TELEFONO
                // =================================================
                subtitle: Text(
                  items[index].telefono,
                ),

                // =================================================
                // AL PRESIONAR
                // =================================================
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Índice del elemento: $index',
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}