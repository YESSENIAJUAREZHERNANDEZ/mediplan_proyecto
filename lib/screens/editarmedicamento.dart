import 'package:flutter/material.dart';

class Medication {
  final String nombre;
  final String descripcion;

  Medication({required this.nombre, required this.descripcion});
}

class MedicationsApp extends StatefulWidget {
  @override
  _MedicationsAppState createState() => _MedicationsAppState();
}

class _MedicationsAppState extends State<MedicationsApp> {
  List<Medication> medication = [];

  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  void addMedication() {
    String nombre = nombreController.text;
    String descripcion = descripcionController.text;

    if (nombre.isNotEmpty && descripcion.isNotEmpty) {
      setState(() {
        medication.add(Medication(nombre: nombre, descripcion: descripcion));
      });

      nombreController.clear();
      descripcionController.clear();
    }
  }

  void removeMedication(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar medicamento'),
          content: Text('¿Seguro que quieres eliminar ${medication[index].nombre}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  medication.removeAt(index);
                });
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Medicamento'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: nombreController,
                    decoration: InputDecoration(
                      labelText: 'Nombre del medicamento',
                    ),
                  ),
                  TextField(
                    controller: descripcionController,
                    decoration: InputDecoration(
                      labelText: 'Descripción del medicamento',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: addMedication,
                    child: Text('agregar medicamento'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: medication.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(medication[index].nombre),
                    subtitle: Text(medication[index].descripcion),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        removeMedication(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MedicationsApp());
}
