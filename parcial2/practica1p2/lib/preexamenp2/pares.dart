import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'filtro.dart';

// Esta es la pantalla principal. Es StatefulWidget porque sus datos cambian (las listas)
// This is the main screen. It is a StatefulWidget because its data changes (the lists)
class Pares extends StatefulWidget {
  // Constructor: no recibe datos, solo la "key" interna de Flutter
  // Constructor: does not receive data, only Flutter's internal "key"
  const Pares({super.key});

  // Obligatorio en todo StatefulWidget: crea el objeto State, donde vive lo que cambia
  // Mandatory in every StatefulWidget: creates the State object, where changing data lives
  @override
  State<Pares> createState() => _ParesState(); // el "_" lo hace privado (solo este archivo) / the "_" makes it private (only this file)
}

// Esta clase es el "cerebro" de la pantalla: guarda las variables y dibuja la interfaz
// This class is the "brain" of the screen: stores variables and draws the interface
class _ParesState extends State<Pares> {
  // Control remoto del TextField: con él leemos y borramos lo que escribe el usuario
  // TextField remote control: used to read and clear what the user types
  final TextEditingController numero = TextEditingController();

  // Lista donde se guardan los números pares (List<int> = lista de enteros)
  // List where even numbers are stored (List<int> = list of integers)
  final List<int> pares = [];

  // Lista donde se guardan los números impares
  // List where odd numbers are stored
  final List<int> impares = [];

  // Método que se ejecuta al presionar el botón "Filtrar"
  // Method executed when pressing the "Filter" button
  void _filtrar() {
    // Convierte el texto a número entero. tryParse devuelve null si no se puede convertir
    // Converts text to an integer. tryParse returns null if conversion fails
    // "int?" significa "un entero que también puede ser null (vacío)"
    // "int?" means "an integer that can also be null (empty)"
    final int? n = int.tryParse(numero.text);

    // Si n es null, la caja estaba vacía o el número era demasiado grande
    // If n is null, the text field was empty or the number was too large
    if (n == null) {
      // Muestra un mensajito temporal abajo de la pantalla (SnackBar)
      // Shows a temporary message at the bottom of the screen (SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe un número entero')),
      );
      // "return" termina el método aquí para que no siga con el código de abajo
      // "return" ends the method here so it doesn't continue with the code below
      return;
    }

    // setState avisa a Flutter que algo cambió y que debe redibujar la pantalla
    // setState notifies Flutter that something changed and it must redraw the screen
    setState(() {
      // "%" es el residuo de la división. Si al dividir entre 2 sobra 0, es par
      // "%" is the remainder of the division. If dividing by 2 leaves 0, it's even
      if (n % 2 == 0) {
        pares.add(n); // agrega el número al final de la lista de pares / adds the number to the end of the list of evens
      } else {
        impares.add(n); // si no es par, es impar: va a la lista de impares / if it's not even, it's odd: goes to the list of odds
      }
    });

    // Vacía la caja de texto para poder escribir otro número
    // Clears the text box to type another number
    numero.clear();

    // Avisa al usuario que el número se clasificó
    // Notifies the user that the number has been classified
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Número filtrado')),
    );
  }

  // Método que abre la segunda ventana mandándole las dos listas
  // Method that opens the second window passing both lists
  void _irAListas() {
    // Navigator.push coloca una pantalla nueva encima de la actual
    // Navigator.push places a new screen on top of the current one
    Navigator.push(
      context, // desde dónde navegamos / where we navigate from
      MaterialPageRoute(
        // builder construye la pantalla de destino
        // builder builds the destination screen
        // Filtro(...) es la clase de filtro.dart; le pasamos las dos listas
        // Filtro(...) is the class from filtro.dart; we pass both lists to it
        builder: (context) => Filtro(pares: pares, impares: impares),
      ),
    );
  }

  // dispose se ejecuta cuando la pantalla se destruye: aquí liberamos recursos
  // dispose runs when the screen is destroyed: here we release resources
  @override
  void dispose() {
    numero.dispose(); // libera el controlador para no gastar memoria / releases the controller to avoid wasting memory
    super.dispose(); // llama al dispose original de Flutter (siempre se pone) / calls Flutter's original dispose (always required)
  }

  // build describe cómo se ve la pantalla. Flutter lo llama cada vez que hay setState
  // build describes what the screen looks like. Flutter calls it every time there's setState
  @override
  Widget build(BuildContext context) {
    // Scaffold es el esqueleto de la pantalla (barra superior + cuerpo)
    // Scaffold is the screen skeleton (app bar + body)
    return Scaffold(
      // Barra superior
      // Top app bar
      appBar: AppBar(
        // Color de fondo de la barra
        // Background color of the bar
        backgroundColor: const Color.fromARGB(255, 228, 158, 66),
        // Título de la barra
        // Title of the bar
        title: const Text(
          'Práctica números pares e impares',
          // Estilo del texto: color casi negro
          // Text style: almost black color
          style: TextStyle(color: Color.fromARGB(255, 23, 23, 23)),
        ),
        // "actions" es una lista de widgets que van a la derecha de la barra
        // "actions" is a list of widgets that go to the right of the bar
        actions: [
          // Botón con ícono: al presionarlo abre directo la segunda ventana
          // Icon button: when pressed, it opens the second window directly
          IconButton(
            // Ícono que se ve en la barra (el de lista, como en tu imagen)
            // Icon visible on the bar (the list icon, like in your image)
            icon: const Icon(Icons.list),
            // Al presionar se ejecuta _irAListas (sin paréntesis: pasamos la función)
            // When pressed, _irAListas runs (without parentheses: we pass the function)
            onPressed: _irAListas,
            // Texto que aparece si el usuario deja presionado el ícono
            // Text that appears if the user long-presses the icon
            tooltip: 'Ver pares e impares',
          ),
        ],
      ),
      // Cuerpo de la pantalla
      // Body of the screen
      body: Center(
        // Padding deja 20 píxeles de espacio por los cuatro lados
        // Padding leaves 20 pixels of space on all four sides
        child: Padding(
          padding: const EdgeInsets.all(20),
          // Column acomoda sus hijos uno debajo de otro
          // Column arranges its children one below the other
          child: Column(
            // Centra los hijos verticalmente
            // Centers children vertically
            mainAxisAlignment: MainAxisAlignment.center,
            // "children" es la lista de widgets de la columna
            // "children" is the list of widgets in the column
            children: [
              // Caja de texto
              // Text field
              TextField(
                controller: numero, // la conectamos con el control remoto / we connect it with the remote control
                // Muestra el teclado numérico en el celular
                // Shows the numeric keyboard on the phone
                keyboardType: TextInputType.number,
                // Solo permite dígitos: si escriben una letra, no aparece
                // Only allows digits: if letters are typed, they don't appear
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // Apariencia: etiqueta flotante y borde rectangular
                // Appearance: floating label and rectangular border
                decoration: const InputDecoration(
                  labelText: 'Escribe un número entero',
                  border: OutlineInputBorder(),
                ),
              ),
              // Espacio vacío de 20 píxeles de alto para separar
              // Empty space 20 pixels high for separation
              const SizedBox(height: 20),
              // SizedBox con ancho infinito hace que el botón ocupe todo el ancho
              // SizedBox with infinite width makes the button span the entire width
              SizedBox(
                width: double.infinity,
                // Botón con ícono y texto
                // Button with icon and text
                child: ElevatedButton.icon(
                  onPressed: _filtrar, // sin paréntesis: pasamos la función, no la ejecutamos / without parentheses: we pass the function, do not execute it
                  icon: const Icon(Icons.filter_alt), // ícono del botón / button icon
                  label: const Text('Filtrar'), // texto del botón / button text
                ),
              ),
              // Otro espacio vacío
              // Another empty space
              const SizedBox(height: 20),
              // Texto que muestra cuántos números hay en cada lista
              // Text showing how many numbers are in each list
              // Se actualiza solo porque _filtrar usa setState
              // Updates automatically because _filtrar uses setState
              Text('Pares: ${pares.length}  |  Impares: ${impares.length}'),
            ],
          ),
        ),
      ),
    );
  }
}