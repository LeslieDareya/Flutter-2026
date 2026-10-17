import 'package:flutter/material.dart';
import 'package:practicaextra/widget/lista.dart';

class Datos extends StatefulWidget {
  const Datos({super.key});//crea un widget que puede cambiar de estado. En este caso, la lista de productos cambia cuando se agregan nuevos productos
  // creates a widget that can change its state. In this case, the product list changes when new products are added

  @override
  State<StatefulWidget> createState() => _DatosState();//crea el estado de la clase Datos. El estado es la parte que cambia, en este caso la lista de productos
  // creates the state for the Datos class. The state is the changing part, in this case the product list
}
class Item{
  final String producto;//final significa que una vez creado no se puede cambiar / final means once created it cannot be changed
  final String descripcion;
  final String precio;
  Item(this.producto,this.descripcion, this.precio);//los valores que me pasen guárdalos en estas variables / save the values passed to me into these variables
}
class _DatosState extends State<Datos> {//la clase _DatosState es la que contiene la lógica de la pantalla Datos. Es privada porque empieza con _
// the _DatosState class contains the logic for the Datos screen. It's private because it starts with _
TextEditingController pre = TextEditingController();//controlador de la caja de texto del producto. Sirve para leer lo que el usuario escribió y para vaciar la caja de texto
// product text field controller. Used to read what the user typed and clear the text box
TextEditingController des = TextEditingController();
TextEditingController prec = TextEditingController();

List<Item> items=[]; //crea la lista, vacía al inicio. Aquí se guardan los productos / creates the list, empty at start. Products are stored here

  void _agregar(){
  setState(() {
    String p = pre.text;
    String d = des.text;
    String pr = prec.text; //Lees lo que el usuario escribió en cada campo y lo guardas en variables de tipo String / You read what the user typed in each field and save it in String variables
    if (p.isNotEmpty && d.isNotEmpty && pr.isNotEmpty){ //Es obligatorio que los tres campos tengan datos. Si alguno está vacío, no se agrega a la lista. / It is mandatory for all three fields to have data. If any is empty, it is not added to the list.
      items.add(Item(p,d,pr));//crea un producto con esos tres textos y items.add(...) lo agrega al final de la lista / creates a product with those three texts and items.add(...) adds it to the end of the list
      pre.clear();
      des.clear();
      prec.clear();//Vacía los tres campos para que el usuario pueda escribir otro producto / Clears the three fields so the user can type another product
       ScaffoldMessenger.of(context).showSnackBar(//se cumple la condición / condition is met
        SnackBar(content: Text("Datos agregados a la lista")),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(//no se cumple la condición / condition is not met
        SnackBar(content: Text("Faltan datos")),
      );
    }

  });
    }


  void _enviar() async {
    Navigator.push(//agrega una pantalla nueva encima de la actual / adds a new screen on top of the current one
      context,//indica desde dónde navegas / indicates where you are navigating from
      MaterialPageRoute(
        builder: (context) => Lista(items: items),//le pasas la lista de productos a la pantalla Lista. La pantalla Lista tiene un parámetro llamado items, que es la lista de productos. Aquí le pasas la lista items que está en esta clase _DatosState.
        // passes the product list to the Lista screen. The Lista screen has an items parameter, which is the product list. Here you pass the items list from this _DatosState class.
      ), // MaterialPageRoute
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos'),
        backgroundColor: Colors.lightGreen,
        actions: [//agrega un botón a la derecha del AppBar derecha de la barra superior / adds a button to the right of the AppBar top bar
          IconButton(
            onPressed: _enviar,//cuando se presiona el botón, se llama a la función _enviar / when the button is pressed, the _enviar function is called
            icon: const Icon(Icons.list),
          ),
        ],
      ), // AppBar
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,//sombra del card / card shadow
            shape: RoundedRectangleBorder(//borde redondeado / rounded border
              borderRadius: BorderRadius.circular(15),
            ), // RoundedRectangleBorder
            child: Padding(
              padding: const EdgeInsets.all(15.0),//espacio entre el borde del card y los widgets que contiene / space between the card border and the widgets it contains
              child: Column(
                mainAxisSize: MainAxisSize.max,//ocupa todo el espacio vertical disponible / takes up all available vertical space
                children: [
                   TextField(
                    controller: pre,
                    decoration: InputDecoration(
                      labelText: 'Escribe el producto',
                      border: OutlineInputBorder(),
                    ),
                  ),
                   TextField(//caja de texto / text field
                    controller: des,
                    decoration: InputDecoration(
                      labelText: 'Escribe una descripcion',
                      border: OutlineInputBorder(),//dibuja un borde rectangular alrededor / draws a rectangular border around
                    ),
                  ),
                   TextField(
                    controller: prec,
                    decoration: InputDecoration(
                      labelText: 'Escribe el precio',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20, //Una caja invisible de 20 píxeles de alto, solo para separar los campos de texto del botón / An invisible 20-pixel high box, just to separate text fields from the button
                  ),
                  SizedBox(
                    width: double.infinity,//el botón ocupa todo el ancho disponible / the button takes up all available width
                    child: ElevatedButton.icon(//botón con ícono y texto / button with icon and text
                      onPressed: _agregar,//ejecuta la función _agregar cuando se presiona el botón / executes the _agregar function when the button is pressed
                      icon: const Icon(Icons.add), //ícono de suma / plus icon
                      label: const Text('Agregar'),//texto del botón / button text
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}