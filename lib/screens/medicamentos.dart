import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginapp.dart';

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
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Row(
      children: [
        IconButton(
          icon: Image.asset('assets/iconos/icono2.png'),
          onPressed: () {},
        ),
        SizedBox(width: 8),
        Text(
          'Medi plan',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),
        ),
      ],
    ),
  ),
 endDrawer: Drawer(
    child: ListView(
      children: [
        DrawerHeader(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/imagenes/campo2.png'),
      fit: BoxFit.cover,
    ),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Medi plan',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(
        'Configuración',
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 48, 24, 49),
        ),
      ),
    ],
  ),
),

        ListTile(
          title: Text('Iniciar sesión',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 1
            Navigator.push( context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
          },
        ),
        ListTile(
          title: Text('Terminos y condiciones',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 2
          },
        ),
        ListTile(
          title: Text('Ayuda',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 3
          },
        ),
      ],
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