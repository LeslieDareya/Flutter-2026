import 'package:flutter/material.dart';
// Importamos la segunda ventana para permitir la navegación
import 'ventana2.dart';

// Widget Stateful: Se usa porque la pantalla cambiará su estado al presionar botones o seleccionar opciones
class Ventana1 extends StatefulWidget {
  @override
  State<Ventana1> createState() => _Ventana1State();
}

class _Ventana1State extends State<Ventana1> {
  // Controlador para leer el contenido del campo de texto
  TextEditingController campoTexto = TextEditingController();

  // Lista con las opciones para el menú desplegable (DropdownButton)
  List<String> opciones = ['Mayúsculas', 'Minúsculas'];

  // Guarda la opción que el usuario tiene seleccionada actualmente
  String opcionSeleccionada = 'Mayúsculas';

  // Variable que actualizará el texto en la mitad inferior (50%)
  String mensajeResultado = "Selección pendiente";

  // Función lógica para contar letras mayúsculas o minúsculas
  int contarLetras(String texto, String tipo) {
    int contador = 0;
    for (int i = 0; i < texto.length; i++) {
      if (tipo == 'Mayúsculas') {
        // Verifica si el carácter es mayúscula
        if (texto[i] == texto[i].toUpperCase() && texto[i] != texto[i].toLowerCase()) {
          contador++;
        }
      } else {
        // Verifica si el carácter es minúscula
        if (texto[i] == texto[i].toLowerCase() && texto[i] != texto[i].toUpperCase()) {
          contador++;
        }
      }
    }
    return contador;
  }

  // Función de validación principal al presionar el botón 'Procesar'
  void procesar() {
    String texto = campoTexto.text.trim(); // .trim() quita espacios extras al inicio y final

    setState(() {
      // Requisito: Validar si la caja está vacía evaluando si la longitud (.length) es igual a 0
      if (texto.length == 0) {
        mensajeResultado = "Campo obligatorio";
      } else {
        // Si no está vacía, realiza el conteo y actualiza el mensaje
        int cantidad = contarLetras(texto, opcionSeleccionada);
        mensajeResultado = "Tiene $cantidad $opcionSeleccionada";

        // Muestra la ventana modal emergente de alerta
        mostrarAlerta(texto, cantidad);
      }
    });
  }

  // Cuadro de diálogo modal de alerta
  void mostrarAlerta(String texto, int cantidad) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Validación"),
        content: Text("La caja NO está vacía."),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.pop cierra la ventana emergente de alerta
              Navigator.pop(context);

              // Al presionar 'Aceptar', navega hacia Ventana2 enviando los datos correspondientes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Ventana2(
                    texto: texto,
                    tipo: opcionSeleccionada,
                    conteo: cantidad,
                  ),
                ),
              );
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
      appBar: AppBar(title: Text('Ventana 1 - Examen')),
      // Column organiza las dos secciones dividiendo la pantalla en forma vertical
      body: Column(
        children: [
          // SECCIÓN 1 (50% SUPERIOR DE LA PANTALLA)
          Expanded(
            flex: 1, // flex: 1 indica que usará exactamente el 50% del alto disponible
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20), // Requisito: Margen exterior de 20 píxeles
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // La columna usa solo el espacio necesario
                    children: [
                      // Caja de texto de entrada
                      TextField(controller: campoTexto),

                      // Menú desplegable (DropdownButton)
                      DropdownButton<String>(
                        value: opcionSeleccionada,
                        isExpanded: true, // Ocupa todo el ancho disponible en la tarjeta
                        items: opciones.map((String valor) {
                          return DropdownMenuItem<String>(
                            value: valor,
                            child: Text(valor),
                          );
                        }).toList(),
                        onChanged: (String? nuevoValor) {
                          setState(() {
                            opcionSeleccionada = nuevoValor!;
                          });
                        },
                      ),

                      // Botón para procesar y validar
                      ElevatedButton(
                        onPressed: procesar,
                        child: Text('Procesar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // SECCIÓN 2 (50% INFERIOR DE LA PANTALLA)
          Expanded(
            flex: 1, // flex: 1 completa el otro 50% de la pantalla (proporción 1:1)
            child: Center(
              child: Text(
                mensajeResultado,
                textAlign: TextAlign.center,
                // Estilos específicos solicitados
                style: TextStyle(
                  fontSize: 34,                // Tamaño 34
                  fontWeight: FontWeight.bold, // Formato Negrita
                  fontFamily: 'Comic Sans MS', // Tipo de letra Comic Sans
                  color: Colors.white,          // Color Azul
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}