import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddMedicationScreen extends StatelessWidget {
  final DatabaseReference medicationsRef;

  AddMedicationScreen({required this.medicationsRef});

  @override
  Widget build(BuildContext context) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController descripcionController = TextEditingController();
    TextEditingController propositoController = TextEditingController();
    TextEditingController administracionController = TextEditingController();

    void addMedication() {
      String id = medicationsRef.push().key ?? ''; // Generar un ID único
      String nombre = nombreController.text;
      String descripcion = descripcionController.text;
      String proposito= propositoController.text;
      String administracion = administracionController.text;

      if (nombre.isNotEmpty && descripcion.isNotEmpty) {
        medicationsRef.child(id).set({
  'nombre': nombre,
  'descripcion': descripcion,
  'proposito': proposito,
  'administracion': administracion,
}).then((_) {
  Navigator.pop(context); 
}).catchError((error) {
  print('Error adding medication: $error');
});

      }
    }

return Scaffold(
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            IconButton(
              icon: Image.asset('assets/iconos/icono2.png'),
              onPressed: () {},
            ),
            SizedBox(width: 8),
            Text(
              'Medi plan',
              style: TextStyle(
                color: Color.fromARGB(255, 48, 24, 49),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
  body: SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Center(
          child: Text(
            'Nuevo medicamento',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 25),
        Text(
          'Nombre del medicamento:',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.blueGrey,
          ),
        ),
        TextField(
          controller: nombreController,
          decoration: InputDecoration(
            hintText: 'Paracetamol, Nolotil, etc',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Dosis prescrita:',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.blueGrey,
          ),
        ),
        TextField(
          controller: descripcionController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Dosis/cantidad',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Propósito del medicamento:',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.blueGrey,
          ),
        ),
        TextField(
          controller: propositoController,
          decoration: InputDecoration(
            hintText: 'Dolor de cabeza, estomago, etc',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Vía de administración:',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.blueGrey,
          ),
        ),
        TextField(
          controller: administracionController,
          decoration: InputDecoration(
            hintText: 'vía oral, vía intravenosa, etc',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: addMedication,
          child: Text(
            'AGREGAR',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 78, 157, 196),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(double.infinity, 45),
          ),
        ),
      ],
    ),
  ),
  ),
);



  }
}
