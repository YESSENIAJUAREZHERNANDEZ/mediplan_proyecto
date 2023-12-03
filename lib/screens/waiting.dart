import 'package:flutter/material.dart';


class Waiting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20), // Espacio entre el indicador y el texto
              Text(
                'Espere un momento',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Vinculando con un dispositivo',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
