import 'package:flutter/material.dart';

void main() => runApp(Barra());

class Barra extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Barra> {
  double _progressValue = 0.5; // Porcentaje de progreso inicial

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Barra de progreso')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0), // Ajusta el espacio horizontal aquí
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Ajusta el radio del borde aquí
                    color: Color.fromARGB(255, 228, 216, 216), // Cambia el color de fondo de la barra aquí
                  ),
                  child: LinearProgressIndicator(
                    value: _progressValue,
                    minHeight: 70, // Ajusta el valor para hacer la barra más ancha
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 235, 126, 126)), // Cambia el color del progreso aquí
                    backgroundColor: Colors.transparent, // Establece el color de fondo del indicador como transparente
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('${(_progressValue * 100).toStringAsFixed(1)}%'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              // Simular avance de progreso
              _progressValue += 0.1;
              if (_progressValue > 1.0) {
                _progressValue = 0.0;
              }
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
