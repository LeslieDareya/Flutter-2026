// Trae todos los widgets de Flutter
// Brings all Flutter widgets
import 'package:flutter/material.dart';
// Trae los "formatters" para limitar lo que se puede escribir (lo usamos en el teléfono)
// Brings the "formatters" to limit what can be typed (used in the phone field)
import 'package:flutter/services.dart';

// Molde de un contacto: cada elemento de la lista guardará un nombre y un teléfono
// Contact model: each list item will store a name and a phone number
class Contacto {
  final String nombre; // nombre de la persona / person's name
  final String telefono; // teléfono de la persona / person's phone number
  // Constructor: los valores que me pasen se guardan en estas variables (por posición)
  // Constructor: the values passed to me are stored in these variables (by position)
  Contacto(this.nombre, this.telefono);
}

// Segunda ventana. Es StatefulWidget porque la lista cambia al agregar contactos
// Second window. It is a StatefulWidget because the list changes when adding contacts
class Lista extends StatefulWidget {
  // Aquí llega el nombre que se escribió en el login
  // Here comes the name typed in the login
  final String nombre;

  // Constructor: "required" significa que es obligatorio mandar el nombre
  // Constructor: "required" means sending the name is mandatory
  const Lista({super.key, required this.nombre});

  // Obligatorio en todo StatefulWidget: crea el objeto State
  // Mandatory in every StatefulWidget: creates the State object
  @override
  State<Lista> createState() => _ListaState();
}

// "Cerebro" de la pantalla: guarda la lista, los controladores y dibuja la interfaz
// Screen "brain": stores the list, controllers, and draws the interface
class _ListaState extends State<Lista> {
  // Control remoto del campo "nombre" del diálogo
  // Remote control for the dialog's "name" field
  final TextEditingController nom = TextEditingController();
  // Control remoto del campo "teléfono" del diálogo
  // Remote control for the dialog's "phone" field
  final TextEditingController tel = TextEditingController();

  // Lista de contactos. Cada elemento es un Contacto
  // List of contacts. Each element is a Contact
  // Empieza con 1 contacto predeterminado; los demás se agregan después con el botón +
  // Starts with 1 default contact; others are added later with the + button
  final List<Contacto> contactos = [
    Contacto('Ana', '3312345678'), // contacto predeterminado: nombre y teléfono / default contact: name and phone
  ];

  // Método que se ejecuta al presionar "Guardar" en el diálogo
  // Method executed when pressing "Save" in the dialog
  void _guardar() {
    // Leemos lo escrito; ".trim()" quita espacios sobrantes al inicio y al final
    // We read what was typed; ".trim()" removes extra spaces at the start and end
    final String n = nom.text.trim(); // nombre escrito / typed name
    final String t = tel.text.trim(); // teléfono escrito / typed phone

    // Si alguno de los dos está vacío, avisamos y no guardamos nada
    // If either of them is empty, we notify and do not save anything
    // "||" significa "o": basta con que uno esté vacío
    // "||" means "or": it's enough for one to be empty
    if (n.isEmpty || t.isEmpty) {
      // Mensaje temporal abajo de la pantalla
      // Temporary message at the bottom of the screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Faltan datos')),
      );
      return; // termina el método: el diálogo sigue abierto para que corrija / ends the method: the dialog stays open for correction
    }

    // setState avisa a Flutter que algo cambió y que debe redibujar la pantalla
    // setState notifies Flutter that something changed and it must redraw the screen
    setState(() {
      contactos.add(Contacto(n, t)); // creamos el contacto y lo agregamos al final de la lista / we create the contact and add it to the end of the list
    });

    nom.clear(); // vacía el campo del nombre / clears the name field
    tel.clear(); // vacía el campo del teléfono / clears the phone field
    Navigator.pop(context); // cierra el diálogo / closes the dialog
  }

  // Método que muestra el cuadro de diálogo para escribir nombre y teléfono
  // Method that shows the dialog box to type name and phone
  void _mostrarDialogo() {
    // showDialog muestra una ventanita flotante encima de la pantalla
    // showDialog displays a floating window on top of the screen
    showDialog(
      context: context, // desde dónde se muestra / where it is shown from
      // builder construye el contenido del diálogo
      // builder builds the dialog content
      builder: (context) {
        // AlertDialog es el tipo de diálogo con título, contenido y botones
        // AlertDialog is the type of dialog with title, content, and buttons
        return AlertDialog(
          title: const Text('Nuevo contacto'), // título del diálogo / dialog title
          // Contenido: una columna con los dos campos
          // Content: a column with the two fields
          content: Column(
            // "min": que la columna ocupe solo lo necesario (si no, el diálogo se estira)
            // "min": make the column take only what is needed (otherwise, the dialog stretches)
            mainAxisSize: MainAxisSize.min,
            children: [
              // Campo del nombre (acepta cualquier texto)
              // Name field (accepts any text)
              TextField(
                controller: nom, // lo conectamos con su control remoto / we connect it to its remote control
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10), // espacio entre los campos / space between fields
              // Campo del teléfono
              // Phone field
              TextField(
                controller: tel, // lo conectamos con su control remoto / we connect it to its remote control
                keyboardType: TextInputType.phone, // teclado de teléfono / phone keyboard
                inputFormatters: [FilteringTextInputFormatter.digitsOnly], // solo dígitos / digits only
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          // "actions" son los botones de abajo del diálogo
          // "actions" are the buttons at the bottom of the dialog
          actions: [
            // Botón para cancelar
            // Cancel button
            TextButton(
              onPressed: () {
                nom.clear(); // borramos lo que se haya escrito / we clear what was typed
                tel.clear();
                Navigator.pop(context); // cierra el diálogo sin guardar / closes the dialog without saving
              },
              child: const Text('Cancelar'),
            ),
            // Botón para guardar
            // Save button
            ElevatedButton(
              onPressed: _guardar, // ejecuta el método de arriba / executes the method above
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  // dispose se ejecuta cuando la pantalla se destruye: liberamos recursos
  // dispose runs when the screen is destroyed: we release resources
  @override
  void dispose() {
    nom.dispose(); // libera el controlador del nombre / releases the name controller
    tel.dispose(); // libera el controlador del teléfono / releases the phone controller
    super.dispose(); // llama al dispose original de Flutter / calls Flutter's original dispose
  }

  // build describe cómo se ve la pantalla
  // build describes what the screen looks like
  @override
  Widget build(BuildContext context) {
    // Scaffold es el esqueleto de la pantalla
    // Scaffold is the screen skeleton
    return Scaffold(
      // Barra superior
      // Top app bar
      appBar: AppBar(
        // "widget.nombre" es el nombre que llegó desde el login: va en el título
        // "widget.nombre" is the name that came from login: goes into the title
        title: Text(widget.nombre),
        backgroundColor: Colors.lightGreen, // color de la barra / bar color
        // "actions" es una lista de widgets que van a la derecha de la barra
        // "actions" is a list of widgets that go to the right of the bar
        actions: [
          IconButton(
            icon: const Icon(Icons.add), // ícono con el símbolo + / icon with the + symbol
            onPressed: _mostrarDialogo, // al presionar, se abre el diálogo / when pressed, opens the dialog
          ),
        ],
      ),
      // Cuerpo: si no hay contactos mostramos un texto, si hay, la lista
      // Body: if there are no contacts we show text, if there are, the list
      // Operador ternario:  condición ? si_es_verdad : si_es_falso
      // Ternary operator: condition ? if_true : if_false
      body: contactos.isEmpty
          ? const Center(child: Text('Aún no hay contactos'))
          // ListView.builder crea una lista con scroll, una fila por elemento
          // ListView.builder creates a scrollable list, one row per item
          : ListView.builder(
              itemCount: contactos.length, // cuántas filas hay / how many rows there are
              // itemBuilder se llama una vez por fila; "index" empieza en 0
              // itemBuilder is called once per row; "index" starts at 0
              itemBuilder: (context, index) {
                // Tomamos el contacto que está en esa posición de la lista
                // We take the contact at that position in the list
                final Contacto c = contactos[index];
                // Card: tarjeta con sombra y bordes redondeados
                // Card: card with shadow and rounded corners
                return Card(
                  margin: const EdgeInsets.all(8), // espacio exterior de la tarjeta / card outer spacing
                  // ListTile: fila prediseñada con espacio para imagen, textos, etc.
                  // ListTile: pre-designed row with space for image, texts, etc.
                  child: ListTile(
                    // "leading" es lo que va a la izquierda: el mismo ícono para todos los contactos
                    // "leading" is what goes on the left: the same icon for all contacts
                    leading: const Icon(
                      Icons.account_circle, // ícono de persona dentro de un círculo / person icon inside a circle
                      size: 45, // tamaño del ícono / icon size
                      color: Colors.lightGreen, // color del ícono / icon color
                    ),
                    title: Text(c.nombre), // nombre del contacto / contact name
                    subtitle: Text('Tel: ${c.telefono}'), // ${ } mete una variable dentro del texto / ${ } embeds a variable inside text
                    // onTap se ejecuta cuando el usuario presiona la fila
                    // onTap runs when the user taps the row
                    onTap: () {
                      // Quita el mensaje anterior (si lo hay) para que el nuevo salga de inmediato
                      // Removes the previous message (if any) so the new one appears immediately
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      // Muestra el índice de la fila presionada
                      // Shows the index of the tapped row
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Índice: $index')),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}