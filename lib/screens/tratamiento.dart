import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/resultadotrata.dart';

void main() {
  runApp(MaterialApp(
    home: TreatmentProgress(),
  ));
}

class TreatmentProgress extends StatefulWidget {
  @override
  _TreatmentProgressState createState() => _TreatmentProgressState();
}

class _TreatmentProgressState extends State<TreatmentProgress> {
  int currentDose = 0;
  int totalDoses = 10;

  TextEditingController dosesController = TextEditingController();

  double calculateDoseProgress() {
    return (currentDose / totalDoses) * 100;
  }

  void administerDoses() {
    int dosesToAdminister = int.tryParse(dosesController.text) ?? 0;
    setState(() {
      currentDose += dosesToAdminister;
      dosesController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treatment Progress'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Porcentaje de avance basado en dosis:',
            ),
            Text(
              '${calculateDoseProgress().toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: TextField(
                controller: dosesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Dosis a administrar'),
              ),
            ),
            ElevatedButton(
              child: Text('Administrar dosis'),
              onPressed: administerDoses,
            ),
            ElevatedButton(
              child: Text('Ver Barra de Progreso'),
              onPressed: () {
                double percentage = calculateDoseProgress();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgressBarScreen(percentage),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
