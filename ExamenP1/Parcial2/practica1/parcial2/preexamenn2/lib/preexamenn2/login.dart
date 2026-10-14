import 'package:flutter/material.dart';
import 'lista.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClaseLogin();
  }
}

class ClaseLogin extends State<Login> {

  // Controladores
  TextEditingController nombre = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController contrasena = TextEditingController();


  void validar() {

    String nombreTexto = nombre.text;
    String correoTexto = correo.text;
    String contrasenaTexto = contrasena.text;

    // El nombre solamente puede tener letras
    // y debe tener mínimo 3 caracteres
    RegExp letras =
        RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ]{3,}$');

    // La contraseña solamente puede tener números
    // y debe tener entre 5 y 10 dígitos
    RegExp numeros =
        RegExp(r'^[0-9]{5,10}$');

    if (!letras.hasMatch(nombreTexto)) {

      mostrarMensaje(
        'El nombre debe tener mínimo 3 letras y únicamente letras',
      );

    } else if (correoTexto.isEmpty) {

      mostrarMensaje(
        'El correo no puede estar vacío',
      );

    } else if (!numeros.hasMatch(contrasenaTexto)) {

      mostrarMensaje(
        'La contraseña debe tener entre 5 y 10 números',
      );

    } else {

      // Enviamos solamente el nombre
      // a la segunda ventana

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Lista2(
            nombreUsuario: nombreTexto,
          ),
        ),
      );
    }
  }

  // =====================================================
  // MOSTRAR MENSAJE
  // =====================================================

  void mostrarMensaje(String mensaje) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
      ),
    );
  }

  // =====================================================
  // DISEÑO DE LA VENTANA
  // =====================================================

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,

        title: Text(
          'Iniciar sesión',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // ==============================
            // NOMBRE
            // ==============================

            TextField(
              controller: nombre,

              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            SizedBox(height: 15),

            // ==============================
            // CORREO
            // ==============================

            TextField(
              controller: correo,

              decoration: InputDecoration(
                labelText: 'Correo',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            SizedBox(height: 15),

            // ==============================
            // CONTRASEÑA
            // ==============================

            TextField(
              controller: contrasena,

              keyboardType: TextInputType.number,

              obscureText: true,

              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            SizedBox(height: 25),

            // ==============================
            // BOTÓN INGRESAR
            // ==============================

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: validar,

                child: Text(
                  'Ingresar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}