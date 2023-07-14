import 'package:flutter/material.dart';

void main() => runApp(Waiting());

class Waiting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/iconos/logout.png'), // Ruta de la imagen
              SizedBox(height: 20), // Espacio entre la imagen y el texto
              Text(
                'Espere un momento',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'vinculando con un dispositivo',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
