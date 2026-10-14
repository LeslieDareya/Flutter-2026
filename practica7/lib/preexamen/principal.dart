import 'package:flutter/material.dart';
// Importamos el archivo de la segunda pantalla para poder navegar a ella
import 'segunda.dart';

// Widget Stateful: Se usa porque la pantalla cambiará de contenido al presionar el botón
class Principal extends StatefulWidget {
  @override
  // Crea el estado de la pantalla en la clase _PrincipalState
  State<Principal> createState() => _PrincipalState();
}

// Clase que maneja toda la lógica (variables, funciones) y la interfaz gráfica
class _PrincipalState extends State<Principal> {
  // Controlador necesario para leer lo que el usuario escribe en el TextField
  TextEditingController campoTexto = TextEditingController();

  // Variable de tipo String para guardar y actualizar el mensaje en el 50% inferior
  String mensajeResultado = "Esperando...";

  // Función que se ejecuta al presionar el botón 'Validar'
  void validarInput() {
    // .trim() elimina espacios en blanco al inicio y al final del texto ingresado
    String texto = campoTexto.text.trim();

    // setState notifica a Flutter que el estado cambió para que vuelva a dibujar la pantalla
    setState(() {
      // Requisito: Evaluar si está vacía verificando si la longitud (length) es 0
      if (texto.length == 0) {
        mensajeResultado = "Está vacía";
      } else {
        mensajeResultado = "No está vacía";
        // Si no está vacía, mostramos la ventana modal de alerta
        mostrarAlerta(texto);
      }
    });
  }

  // Función para desplegar la ventana emergente de alerta
  void mostrarAlerta(String textoIngresado) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Alerta"), // Título del mensaje emergente
        content: Text("La caja NO está vacía"), // Mensaje principal
        actions: [
          // Botón dentro de la alerta
          TextButton(
            onPressed: () {
              // Navigator.pop cierra el cuadro de diálogo emergente
              Navigator.pop(context);

              // double.tryParse intenta convertir el texto a número.
              // Si NO es nulo (!= null), significa que el texto sí es un número válido.
              if (double.tryParse(textoIngresado) != null) {
                // Navigator.push abre la nueva pantalla colocando 'Segunda' encima en la pila
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // Pasamos la variable textoIngresado a la segunda pantalla
                    builder: (context) => Segunda(valorEnviado: textoIngresado),
                  ),
                );
              }
            },
            child: Text("Aceptar"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Examen')), // Barra superior con título
      // Column organiza los elementos de arriba hacia abajo
      body: Column(
        children: [
          // --- PRIMERA SECCIÓN (50% SUPERIOR) ---
          // Expanded distribuye el espacio vertical. flex: 1 indica 50% del total
          Expanded(
            flex: 1,
            child: Center( // Centra la tarjeta horizontal y verticalmente
              child: Padding(
                padding: EdgeInsets.all(20), // Requisito: Margen exterior de 20 píxeles
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // La columna usa solo el alto necesario
                    children: [
                      // Caja para que el usuario ingrese datos
                      TextField(controller: campoTexto),
                      // Botón para procesar la información
                      ElevatedButton(
                        onPressed: validarInput, // Llama al método de validación
                        child: Text('Validar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // --- SEGUNDA SECCIÓN (50% INFERIOR) ---
          // flex: 1 le da el otro 50% de la pantalla (proporción 1:1)
          Expanded(
            flex: 1,
            child: Center( // Centra el texto dentro del 50% inferior
              child: Text(
                mensajeResultado, // Variable dinámica que cambia según la validación
                // Requisitos estrictos de diseño para el texto
                style: TextStyle(
                  fontSize: 34,               // Tamaño de fuente 34
                  fontWeight: FontWeight.bold,// Texto en negrita
                  fontFamily: 'Comic Sans MS',// Tipo de letra Comic Sans
                  color: Colors.blue,          // Color azul
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}