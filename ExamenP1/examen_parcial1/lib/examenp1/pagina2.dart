
import 'package:flutter/material.dart';
import 'pagina3.dart';

class SegundaVentana extends StatefulWidget {
  @override
  State createState() {
    return Datos();
  }
}

class Datos extends State {
  final TextEditingController n1 = TextEditingController();
  final TextEditingController n2 = TextEditingController();
  final TextEditingController n3 = TextEditingController();
  final TextEditingController n4 = TextEditingController();

  String r = "";

  @override
  void dispose() {
    n1.dispose();
    n2.dispose();
    n3.dispose();
    n4.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
        backgroundColor: const Color.fromARGB(255, 28, 177, 85),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            "Resultado: $r",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final int a = int.tryParse(n1.text) ?? 0;
                final int b = int.tryParse(n2.text) ?? 0;
                final int c = int.tryParse(n3.text) ?? 0;
                final int d = int.tryParse(n4.text) ?? 0;
                setState(() {
                  r = "${(a + b + c + d) / 4}";
                });
              },
              child: Text('Calcular promedio'),
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final int a = int.tryParse(n1.text) ?? 0;
                final int b = int.tryParse(n2.text) ?? 0;
                final int c = int.tryParse(n3.text) ?? 0;
                final int d = int.tryParse(n4.text) ?? 0;

                List<int> numeros = [a, b, c, d];
                numeros.sort(); // Ordena de menor a mayor

            
                int mayor1 = numeros[3];
                int mayor2 = numeros[2];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pagina3(num1: mayor1, num2: mayor2),
                  ),
                );
              },
              child: Text('Enviar los 2 números mayores'),
            ),
          ),
          TextField(
            controller: n1,
            decoration: InputDecoration(
              labelText: 'Numero 1',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: n2,
            decoration: InputDecoration(
              labelText: 'Numero 2',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: n3,
            decoration: InputDecoration(
              labelText: 'Numero 3',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: n4,
            decoration: InputDecoration(
              labelText: 'Numero 4',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}