import 'package:flutter/material.dart';

class ProgressBarScreen extends StatelessWidget {
  final double percentage;

  ProgressBarScreen(this.percentage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Porcentaje de avance:',
            ),
            Text(
              '${percentage.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: percentage / 100,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
