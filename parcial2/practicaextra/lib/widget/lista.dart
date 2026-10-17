
import 'package:flutter/material.dart';
import 'datos.dart';

class Lista extends StatefulWidget {
  final List<Item> items;//la lista de productos que se va a mostrar. Es final porque no se puede cambiar, solo se puede leer. Se pasa desde la pantalla Datos.
  // the product list to display. It is final because it cannot be changed, only read. Passed from the Datos screen.
  const Lista({ 
    super.key,
    required this.items,//es obligatorio pasar la lista de productos. Si no se pasa, da error. El parámetro required indica que es obligatorio.
    // passing the product list is mandatory. If not passed, it errors out. The required parameter indicates it's mandatory.
  });
  @override
  State<StatefulWidget> createState() => _ListaState();//crea el estado de la clase Lista. El estado es la parte que cambia, en este caso la lista de productos
  // creates the state for the Lista class. The state is the changing part, in this case the product list
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de productos'),
        backgroundColor: Colors.lightGreen,
      ), // AppBar
      body: items.isEmpty
          ? Center(  ////Si es verdad (después del ?): muestra el Center con “Lista Vacia”. / If true (after ?): displays Center with "Lista Vacia".
            child: Text(
              'Lista Vacia',
               style: TextStyle(
                color: Colors.red,),),
          ) // Center
          : Center(  /// Si es falso (después del :): muestra el Center con la lista. / If false (after :): displays Center with the list.
            child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView.builder(
           itemCount: items.length,///es cuántos elementos tiene la lista. Si hay 3 productos, vale 3. Con esto Flutter sabe cuántas filas crear.
           // how many elements the list has. If there are 3 products, it's 3. With this Flutter knows how many rows to create.
           itemBuilder: (context, index){
             final item = items[index];
             return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.production_quantity_limits),
                title: Text(item.producto),
                subtitle: Column(///apila widgets verticalmente / stacks widgets vertically
                  children: [
                    Text(item.descripcion),
                    Text('Precio: ${item.precio}'),
                  ],
                ),
                trailing: IconButton(///trailing es lo que va al final (derecha) / trailing is what goes at the end (right)
                  color: Colors.red,
                  onPressed: (){
                    setState(() {
                      //print('Eliminar $index');
                      items.removeAt(index);///borra de la lista el producto de esa fila / deletes the product of that row from the list
                    });
                  },
                  icon: Icon(Icons.delete)
                ),
              ),
              );
              
                },
                // Acción al hacer clic en el elemento de la lista / Action when clicking list item
              
            ), 
          ),
          ),// ListTile
        ); // Card
    }
}