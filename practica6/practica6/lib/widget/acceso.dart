import 'package:flutter/material.dart';


class Acceso extends StatefulWidget{
  final String dato, datop;

  const Acceso({super.key, required this.dato, required this.datop});
  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<Acceso>{
  String d = "", p = "";

@override
  void initState(){ //se ejecuta al inicio de la clase
    super.initState();
    d = widget.dato;
    p = widget.datop;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 215, 215),
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Card(
            elevation: 8,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Ingresa los datos',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue
                  ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: ClipOval(
                      child: Image.asset("assets/cara.jpg"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Bienvenido $d \ny su password: $p")
                ],
              ),
            ),
          ),
          ),
      ),
    );
  }
}

