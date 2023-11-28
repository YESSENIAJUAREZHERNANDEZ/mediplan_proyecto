import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

// Define la clase Medication para los medicamentos
class Medication {
  final String nombre;
  final String descripcion;
  final String proposito;
  final String administracion;

  Medication({
    required this.nombre,
    required this.descripcion,
    required this.proposito,
    required this.administracion,
  });
}

// Define la clase Recordatorio para los recordatorios
class Reminders {
  final DateTime dateTime;
  final String name;

  Reminders({required this.dateTime, required this.name});
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Remi());
}

class Remi extends StatefulWidget {
  @override
  _MedicationsAppState createState() => _MedicationsAppState();
}

class _MedicationsAppState extends State<Remi> {
  List<Medication> medication = [];
  List<Reminders> recordatorios = [];

  DatabaseReference _medicationsRef =
      FirebaseDatabase.instance.reference().child('medications');

  DatabaseReference _recordatoriosRef =
      FirebaseDatabase.instance.reference().child('reminders');

  @override
  void initState() {
    super.initState();

    // Obtener datos de Medications
    _medicationsRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          medication.clear();
          Map<dynamic, dynamic> values =
              event.snapshot.value as Map<dynamic, dynamic>;
          values.forEach((key, values) {
            String nombre = values['nombre'] ?? '';
            String descripcion = values['descripcion'] ?? '';
            String proposito = values['proposito'] ?? '';
            String administracion = values['administracion'] ?? '';

            medication.add(Medication(
              nombre: nombre,
              descripcion: descripcion,
              proposito: proposito,
              administracion: administracion,
            ));
          });
        });
      }
    });

    // Obtener datos de Recordatorios
    _recordatoriosRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          recordatorios.clear();
          Map<dynamic, dynamic> values =
              event.snapshot.value as Map<dynamic, dynamic>;
          values.forEach((key, values) {
            DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                values['dateTime'] ?? 0);
            String name = values['name'] ?? '';

            recordatorios.add(Reminders(
              dateTime: dateTime,
              name: name,
            ));
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Medi plan'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: medication.length + recordatorios.length,
                itemBuilder: (context, index) {
                  if (index < medication.length) {
                    // Construir elementos de la lista para Medicamentos
                    return ListTile(
                      title: Text('${medication[index].nombre}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Propósito: ${medication[index].proposito}'),
                          Text('Vía de Administración: ${medication[index].administracion}'),
                        ],
                      ),
                    );
                  } else {
                    // Construir elementos de la lista para Recordatorios
                    int recordatorioIndex = index - medication.length;
                    return ListTile(
                      title: Text(
                        'Recordatorio: ${recordatorios[recordatorioIndex].name}',
                      ),
                      subtitle: Text(
                        'Fecha y hora: ${recordatorios[recordatorioIndex].dateTime.toString()}',
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
