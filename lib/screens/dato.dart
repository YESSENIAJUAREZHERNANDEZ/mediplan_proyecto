import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Medication {
  final String nombre;
  final String descripcion;

  Medication({required this.nombre, required this.descripcion});
}

class MedicationListScreen extends StatefulWidget {
  @override
  _MedicationListScreenState createState() => _MedicationListScreenState();
}

class _MedicationListScreenState extends State<MedicationListScreen> {
  List<Medication> medicationList = [];

  DatabaseReference _medicationsRef =
      FirebaseDatabase.instance.reference().child('medications');

  @override
  void initState() {
    super.initState();
    _fetchMedications();
  }

  void _fetchMedications() {
    _medicationsRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        List<Medication> medications = [];
        Map<dynamic, dynamic> values =
            event.snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, values) {
          medications.add(Medication(
            nombre: values['nombre'],
            descripcion: values['descripcion'],
          ));
        });
        setState(() {
          medicationList = medications;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicamentos'),
      ),
      body: ListView.builder(
        itemCount: medicationList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(medicationList[index].nombre),
            subtitle: Text(medicationList[index].descripcion),
          );
        },
      ),
    );
  }
}
