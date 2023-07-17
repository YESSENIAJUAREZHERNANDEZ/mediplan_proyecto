import 'package:flutter/material.dart';

class MedicationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MedicationScreen(),
    );
  }
}

class MedicationScreen extends StatefulWidget {
  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  List<String> medications = [];

  TextEditingController medicationController = TextEditingController();

  void addMedication() {
    setState(() {
      medications.add(medicationController.text);
      medicationController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Establece el fondo transparente
      title: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            iconSize: 40.0,
            icon: Image.asset('assets/iconos/icono2.png'),
            onPressed: () {},
          ),
          Row(
            children: <Widget>[
              IconButton(
                iconSize: 20.0,
                icon: Image.asset('assets/imagenes/blanco.png'),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 40.0,
                icon: Image.asset('assets/iconos/menu.png'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: medicationController,
              decoration: InputDecoration(
                labelText: 'Nombre del medicamento',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: addMedication,
            child: Text('Agregar medicamento'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medications.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(medications[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}