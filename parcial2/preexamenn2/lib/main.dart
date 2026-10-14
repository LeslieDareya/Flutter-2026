import 'package:flutter/material.dart';
import 'package:preexamenn2/preexamenn2/login.dart';

void main() {
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agenda de contactos',
      home:Login(),
    );
  }
}