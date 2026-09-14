// Importa el paquete de Material Design para construir la interfaz gráfica de Flutter
import 'package:flutter/material.dart';
// Importa el widget 'Acceso' de otra vista para la navegación al autenticarse
import 'package:practica6/widget/acceso.dart';

// Widget con estado para la pantalla de Login
class Login extends StatefulWidget {
  // Crea el estado mutable para este widget en la clase 'Clase'
  @override
  State createState() {
    return Clase();
  }
}

// Clase que administra el estado y la vista gráfica de 'Login'
class Clase extends State {
  // Controladores para capturar y manipular el texto escrito en cada campo
  TextEditingController usuario = new TextEditingController();
  TextEditingController password = new TextEditingController();

  // Función encargada de validar el usuario y contraseña
  void validar() {
    // Obtiene los valores ingresados en los campos de texto
    String u = usuario.text;
    String p = password.text;

    // Notifica a Flutter que el estado va a cambiar para actualizar la interfaz si es necesario
    setState(() {
      // Compara las credenciales ingresadas con los valores requeridos
      if (u == "admin" && p == "12345") {
        //Alertas("Datos Correctos", "Bienvenido");
        //Navigator.push( //esto Si permite regresar
        
        // Navega a la pantalla 'Acceso' reemplazando la ruta actual (evita regresar al Login con el botón atrás)
        Navigator.pushReplacement( //este NO me permite regresar
          context,
          MaterialPageRoute(
            // Instancia el widget 'Acceso' pasándole los datos capturados
            builder: (context) => Acceso(
              dato: u,
              datop: p
            )
          )
        );
      } else {
        // Si los datos son incorrectos, muestra el diálogo de alerta
        Alertas("Error", "Datos incorrectos");
        // Limpia el contenido de los inputs de usuario y contraseña
        usuario.clear();
        password.clear();
      }
    });
  }

  // Función reutilizable para desplegar un cuadro de diálogo emergente (modal)
  void Alertas(String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Título del diálogo con estilo personalizado
          title: Text(
            titulo,
            style: TextStyle(
              fontSize: 22,
              color: Colors.blue
            ),
          ),
          // Mensaje de cuerpo del diálogo
          content: Text(
            mensaje,
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue
            ),
          ),
          // Botones de acción dentro del diálogo
          actions: [
            TextButton(
              // Cierra la ventana emergente de alerta
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text("Aceptar")
            )
          ],
        );
      }
    );
  }

  // Construcción de la interfaz gráfica principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Color de fondo de la pantalla
      backgroundColor: const Color.fromARGB(255, 215, 215, 215),
      
      // Barra superior con el título 'Login'
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.cyanAccent,
      ),
      
      // Centra todo el contenido vertical y horizontalmente
      body: Center(
        child: Padding(
          // Margen externo alrededor de la tarjeta
          padding: EdgeInsets.all(15),
          child: Card(
            elevation: 8, // Sombra para elevación
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15) // Esquinas redondeadas de la tarjeta
            ),
            child: Padding(
              // Margen interno dentro de la tarjeta
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // La columna usa solo el espacio vertical necesario
                children: [
                  // Título superior del formulario
                  Text(
                    'Ingresa los datos',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue
                    ),
                  ),
                  SizedBox(height: 10), // Separador vertical
                  
                  // Contenedor circular que encierra la imagen de perfil
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: ClipOval(
                      child: Image.asset("assets/cara.jpg"), // Muestra la imagen cargada
                    ),
                  ),
                  SizedBox(height: 10),
                  
                  // Campo de texto para ingresar el Usuario
                  Container(
                    width: double.infinity,
                    child: TextField(
                      controller: usuario, // Enlaza el texto escrito con el controlador
                      decoration: InputDecoration(
                        labelText: "Escribe el Usuario",
                        hintText: "Ingresa el Usuario...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  
                  // Campo de texto para ingresar la Contraseña
                  Container(
                    width: double.infinity,
                    child: TextField(
                      controller: password, // Enlaza la contraseña escrita con el controlador
                      decoration: InputDecoration(
                        labelText: "Escribe el Password",
                        hintText: "Ingresa el Password...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  
                  // Botón para ejecutar el proceso de validación
                  Container(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: validar, // Asigna la función de validación al presionar
                      label: Text(
                        'Aceptar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}