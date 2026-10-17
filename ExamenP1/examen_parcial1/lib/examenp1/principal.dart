import 'package:flutter/material.dart';
import 'pagina2.dart';

// Definición de un widget con estado (StatefulWidget) llamado MostrarImagenes
class MostrarImagenes extends StatefulWidget {
  // Constructor constante con super.key para la identificación del widget
  const MostrarImagenes({super.key});
  

  @override
  // Crea e inicializa el estado mutable asociado invocando a la clase Imagenes
  State createState() {
    return Imagenes();
  }
}

class Imagenes extends State {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
     
      appBar: AppBar(
        title: const Text('Examen Parcial 1'),
        backgroundColor: const Color.fromARGB(255, 28, 177, 85),
      ),
      
        
      // Cuerpo organizado de forma vertical
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bienvenido al primer examen de flutter',
            style: TextStyle(
              color: const Color.fromARGB(255, 28, 7, 88),
              fontSize: 25,
         
            ),
          ),
           Container(
            width: double.infinity,
            child: ElevatedButton(
              
              onPressed: () {
                Navigator.push(
               context,
               MaterialPageRoute(
               builder: (context) => SegundaVentana(),
               ),
                );

              },
              child: Text('Continuar al examen'),

                ),
            ),
          
          // Contenedor principal que fija el alto de la lista desplegable de imágenes
          Container(
            width: double.infinity,
            height: 500,
            // Centra el contenido dentro del contenedor
            child: Center(
              // Habilita el desplazamiento (scroll) vertical si los elementos sobrepasan los 500px de altura
              child: SingleChildScrollView(
                // Alinea las imágenes en una columna vertical centrada
                child: Column(
                  children: [
                
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Sombra suave en negro semi-transparente
                            blurRadius: 10,       // Difuminado de la sombra
                            offset: Offset(0, 4), // Desplazamiento vertical de la sombra
                          ),
                        ],
                      ),
                      // Renderizado del recurso de imagen local desde la carpeta assets
                      child: Image.asset(
                        "assets/logo1.png",
                        width: 300,
                        height: 300,
                        fit: BoxFit.contain, // Mantiene la proporción de la imagen sin recortar
                      ),
                    ),
                  //LOGO2

                    const SizedBox(height: 20),

                 
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/logo2.png",
                        width: 300,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    ),

                  //LOGO3
                    const SizedBox(height: 20),

                   
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/logo3.png",
                        width: 300,
                        fit: BoxFit.contain,

                      ),
                    ),

                    //LOGO4

                      const SizedBox(height: 20),

                    DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/logo4.png",
                        width: 300,
                        fit: BoxFit.contain,

                          ),
                    ),

                    //LOGO5

                      const SizedBox(height: 20),

                    DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/logo5.png",
                        width: 300,
                        fit: BoxFit.contain,

                        
                      ),
                    ),
                  ],
             
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

