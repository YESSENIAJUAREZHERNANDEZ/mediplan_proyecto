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
      home: Scaffold(
        appBar: AppBar(title: Text('Barra de progreso')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearProgressIndicator(
                value: _progressValue,
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
