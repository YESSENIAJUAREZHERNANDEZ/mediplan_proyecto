import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(Muppet());
}

class Muppet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddMedicationScreen(),
    );
  }
}

class AddMedicationScreen extends StatelessWidget {
  final TextEditingController medicationNameController = TextEditingController();
  final TextEditingController medicationTimeController = TextEditingController();
  final TextEditingController medicationAmountController = TextEditingController();
  final TextEditingController medicationDurationController = TextEditingController();

  final DatabaseReference _database = FirebaseDatabase.instance.reference().child('medicamentos');

  void addMedication() {
    _database.push().set({
      'nombre': medicationNameController.text,
      'hora': medicationTimeController.text,
      'cantidad': medicationAmountController.text,
      'duracion': int.parse(medicationDurationController.text), // Convertir a entero
    }).then((_) {
      // Mostrar mensaje de éxito o redirigir a otra pantalla
      print('Medicamento agregado exitosamente');
    }).catchError((error) {
      // Manejar cualquier error
      print('Error al agregar el medicamento: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Medicamento'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: medicationNameController,
              decoration: InputDecoration(labelText: 'Nombre del Medicamento'),
            ),
            TextField(
              controller: medicationTimeController,
              decoration: InputDecoration(labelText: 'Hora para tomarlo'),
            ),
            TextField(
              controller: medicationAmountController,
              decoration: InputDecoration(labelText: 'Cantidad'),
            ),
            TextField(
              controller: medicationDurationController,
              decoration: InputDecoration(labelText: 'Duración del Tratamiento (días)'),
              keyboardType: TextInputType.number, // Teclado numérico
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addMedication();
              },
              child: Text('Guardar Medicamento'),
            ),
          ],
        ),
      ),
    );
  }
}
