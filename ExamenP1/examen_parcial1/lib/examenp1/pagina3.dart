import 'package:flutter/material.dart';

class TerceraVentana extends StatelessWidget {
  final int num1;
  final int num2;

  const TerceraVentana({super.key, required this.num1, required this.num2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 3'),
        backgroundColor: const Color.fromARGB(255, 28, 177, 85),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Primer número mayor: $num1',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              'Segundo número mayor: $num2',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}