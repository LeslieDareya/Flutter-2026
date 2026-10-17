// Trae todos los widgets de Flutter (Scaffold, Text, TextField, etc.)
// Brings all Flutter widgets (Scaffold, Text, TextField, etc.)
import 'package:flutter/material.dart';
// Trae los "formatters", que sirven para limitar lo que el usuario puede escribir
// Brings the "formatters", which are used to limit what the user can type
import 'package:flutter/services.dart';
// Trae la segunda ventana (lista.dart) porque desde aquí vamos a navegar hacia ella
// Brings the second window (lista.dart) because from here we will navigate to it
import 'lista.dart';

// Pantalla del login. Es StatefulWidget porque usa controladores de texto
// Login screen. It is a StatefulWidget because it uses text controllers
class Login extends StatefulWidget {
  // Constructor: no recibe datos, solo la "key" interna de Flutter
  // Constructor: does not receive data, only Flutter's internal "key"
  const Login({super.key});

  // Obligatorio en todo StatefulWidget: crea el objeto State
  // Mandatory in every StatefulWidget: creates the State object
  @override
  State<Login> createState() => _LoginState(); // el "_" lo hace privado a este archivo / the "_" makes it private to this file
}

// Esta clase es el "cerebro" de la pantalla: guarda variables, métodos y dibuja la interfaz
// This class is the screen "brain": stores variables, methods, and draws the interface
class _LoginState extends State<Login> {
  // Control remoto del campo "nombre": sirve para leer lo que escribe el usuario
  // Remote control for the "name" field: used to read what the user types
  final TextEditingController nombre = TextEditingController();
  // Control remoto del campo "correo"
  // Remote control for the "email" field
  final TextEditingController correo = TextEditingController();
  // Control remoto del campo "contraseña"
  // Remote control for the "password" field
  final TextEditingController contrasena = TextEditingController();

  // Método auxiliar para mostrar mensajes. Lo creamos para no repetir el mismo código muchas veces
  // Helper method to show messages. We created it to avoid repeating the same code many times
  // "String texto" es el mensaje que vamos a mostrar
  // "String texto" is the message we are going to show
  void _mensaje(String texto) {
    // Muestra un mensaje temporal abajo de la pantalla (SnackBar)
    // Shows a temporary message at the bottom of the screen (SnackBar)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto)),
    );
  }

  // Método que se ejecuta al presionar el botón "Ingresar"
  // Method executed when pressing the "Login" button
  void _validar() {
    // Leemos lo que escribió el usuario y lo guardamos en variables cortas
    // We read what the user typed and save it in short variables
    final String n = nombre.text; // nombre escrito / typed name
    final String c = correo.text; // correo escrito / typed email
    final String p = contrasena.text; // contraseña escrita / typed password

    // Regla 1: el nombre debe tener mínimo 3 letras
    // Rule 1: the name must have at least 3 letters
    // ".length" es la cantidad de caracteres del texto
    // ".length" is the character count of the text
    if (n.length < 3) {
      _mensaje('El nombre debe tener al menos 3 letras'); // avisamos del error / we notify of the error
      return; // "return" termina el método aquí: ya no se revisa lo demás / "return" ends the method here: the rest is no longer checked
    }

    // Regla 2: el correo acepta cualquier carácter, solo revisamos que no esté vacío
    // Rule 2: the email accepts any character, we only check that it is not empty
    // ".trim()" quita los espacios del inicio y del final (así "   " cuenta como vacío)
    // ".trim()" removes spaces from the beginning and end (so "   " counts as empty)
    if (c.trim().isEmpty) {
      _mensaje('Escribe tu correo'); // avisamos del error / we notify of the error
      return; // terminamos aquí / we end here
    }

    // Regla 3: la contraseña debe tener entre 5 y 10 dígitos
    // Rule 3: the password must have between 5 and 10 digits
    // "||" significa "o": es error si tiene menos de 5 o más de 10
    // "||" means "or": it's an error if it has less than 5 or more than 10
    // (que sean solo números ya lo garantiza el formatter del campo)
    // (being only numbers is already guaranteed by the field's formatter)
    if (p.length < 5 || p.length > 10) {
      _mensaje('La contraseña debe tener entre 5 y 10 dígitos'); // avisamos del error / we notify of the error
      return; // terminamos aquí / we end here
    }

    // Si llegamos hasta aquí, todos los datos son correctos: pasamos a la otra ventana
    // If we reach here, all data is correct: we move to the other window
    // Navigator.push coloca una pantalla nueva encima de la actual
    // Navigator.push places a new screen on top of the current one
    Navigator.push(
      context, // desde dónde navegamos / where we navigate from
      MaterialPageRoute(
        // builder construye la pantalla de destino
        // builder builds the destination screen
        // Lista(nombre: n) crea la ventana 2 y le manda ÚNICAMENTE el nombre
        // Lista(nombre: n) creates window 2 and sends ONLY the name to it
        builder: (context) => Lista(nombre: n),
      ),
    );
  }

  // dispose se ejecuta cuando la pantalla se destruye: aquí liberamos recursos
  // dispose runs when the screen is destroyed: here we release resources
  @override
  void dispose() {
    nombre.dispose(); // libera el controlador del nombre / releases the name controller
    correo.dispose(); // libera el controlador del correo / releases the email controller
    contrasena.dispose(); // libera el controlador de la contraseña / releases the password controller
    super.dispose(); // llama al dispose original de Flutter (siempre se pone) / calls Flutter's original dispose (always required)
  }

  // build describe cómo se ve la pantalla
  // build describes what the screen looks like
  @override
  Widget build(BuildContext context) {
    // Scaffold es el esqueleto de la pantalla (barra superior + cuerpo)
    // Scaffold is the screen skeleton (app bar + body)
    return Scaffold(
      // Barra superior
      // Top app bar
      appBar: AppBar(
        title: const Text('Login'), // título de la barra / bar title
        backgroundColor: Colors.lightGreen, // color de fondo de la barra / background color of the bar
      ),
      // Cuerpo de la pantalla: Center centra su contenido
      // Screen body: Center centers its content
      body: Center(
        // SingleChildScrollView permite hacer scroll, así el teclado no tapa los campos
        // SingleChildScrollView allows scrolling so the keyboard doesn't cover the fields
        child: SingleChildScrollView(
          // Espacio de 20 píxeles alrededor del contenido
          // 20-pixel space around the content
          padding: const EdgeInsets.all(20),
          // Column acomoda sus hijos uno debajo de otro
          // Column arranges its children one below the other
          child: Column(
            // "min": la columna ocupa solo el espacio que necesita (necesario dentro del scroll)
            // "min": the column takes only the space it needs (necessary inside the scroll)
            mainAxisSize: MainAxisSize.min,
            // "children" es la lista de widgets de la columna
            // "children" is the list of widgets in the column
            children: [
              // ---------- CAMPO NOMBRE ----------
              // ---------- NAME FIELD ----------
              TextField(
                controller: nombre, // lo conectamos con su control remoto / we connect it to its remote control
                // Solo deja escribir letras (incluye acentos y ñ). Cualquier otro carácter no aparece
                // Only allows typing letters (includes accents and ñ). Any other character does not appear
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ]'),
                  ),
                ],
                // Apariencia: etiqueta flotante y borde rectangular
                // Appearance: floating label and rectangular border
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              // Espacio vacío de 15 píxeles de alto para separar
              // 15-pixel high empty space for separation
              const SizedBox(height: 15),

              // ---------- CAMPO CORREO ----------
              // ---------- EMAIL FIELD ----------
              TextField(
                controller: correo, // lo conectamos con su control remoto / we connect it to its remote control
                // Teclado pensado para correos (trae la arroba a la mano)
                // Keyboard designed for emails (brings the @ sign handy)
                keyboardType: TextInputType.emailAddress,
                // Sin inputFormatters: acepta cualquier carácter, como pide el ejercicio
                // Without inputFormatters: accepts any character, as requested by the exercise
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15), // otro espacio para separar / another space for separation

              // ---------- CAMPO CONTRASEÑA ----------
              // ---------- PASSWORD FIELD ----------
              TextField(
                controller: contrasena, // lo conectamos con su control remoto / we connect it to its remote control
                obscureText: true, // oculta lo escrito con puntitos / hides what is typed with dots
                keyboardType: TextInputType.number, // teclado numérico / numeric keyboard
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // solo deja escribir dígitos / only allows typing digits
                  LengthLimitingTextInputFormatter(10), // máximo 10 caracteres / maximum 10 characters
                ],
                decoration: const InputDecoration(
                  labelText: 'Contraseña (5 a 10 dígitos)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20), // espacio antes del botón / space before the button

              // ---------- BOTÓN ----------
              // ---------- BUTTON ----------
              // SizedBox con ancho infinito hace que el botón ocupe todo el ancho
              // SizedBox with infinite width makes the button span the entire width
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _validar, // sin paréntesis: pasamos la función, no la ejecutamos / without parentheses: we pass the function, do not execute it
                  child: const Text('Ingresar'), // texto del botón / button text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}