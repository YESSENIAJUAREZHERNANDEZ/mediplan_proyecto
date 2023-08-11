import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/screens/googlelogin.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:flutter_application_1/screens/splash_dos.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Medication {
  final String nombre;
  final String descripcion;

  Medication({required this.nombre, required this.descripcion});
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MedicationsApp());
}

class MedicationsApp extends StatefulWidget {
     void _signOut(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('isUserLoggedIn'); // Eliminar el estado de inicio de sesión
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Splashdos(), // Redirigir a la página de inicio de sesión
      ),
    );
  }
  @override
  _MedicationsAppState createState() => _MedicationsAppState();
}

class _MedicationsAppState extends State<MedicationsApp> {
  List<Medication> medication = [];

  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  DatabaseReference _medicationsRef =
      FirebaseDatabase.instance.reference().child('medications');

  @override
void initState() {
  super.initState();
  _medicationsRef.onValue.listen((event) {
    if (event.snapshot.value != null) {
      setState(() {
        medication.clear();
        Map<dynamic, dynamic> values =
            event.snapshot.value as Map<dynamic, dynamic>; // Cast the value here
        values.forEach((key, values) {
          medication.add(Medication(
            nombre: values['nombre'],
            descripcion: values['descripcion'],
          ));
        });
      });
    }
  });
}


  void addMedication() {
    String nombre = nombreController.text;
    String descripcion = descripcionController.text;

    if (nombre.isNotEmpty && descripcion.isNotEmpty) {
      _medicationsRef.push().set({
        'nombre': nombre,
        'descripcion': descripcion,
      }).then((_) {
        setState(() {
          nombreController.clear();
          descripcionController.clear();
        });
      }).catchError((error) {
        print('Error adding medication: $error');
      });
    }
  }

  void removeMedication(String key) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar medicamento'),
          content: Text('¿Seguro que quiere eliminar este medicamento?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _medicationsRef.child(key).remove().then((_) {
                  Navigator.of(context).pop(); // Close the dialog
                }).catchError((error) {
                  print('Error removing medication: $error');
                });
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          title: Text('Información de la cuenta',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 1
            Navigator.push( context,
                  MaterialPageRoute(builder: (context) => LoginScreen() ),
                );
          },
        ),
        ListTile(
          title: Text(
            'Cerrar sesión',
            style: TextStyle(color: Color.fromARGB(255, 48, 24, 49), fontSize: 16),
          ),
          onTap: () {
            // Llamar a la función para cerrar sesión
            
          },
        ),
        ListTile(
          title: Text('',
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
            Text(
              'Medicamentos',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: nombreController,
                    decoration: InputDecoration(
                      labelText: 'Nombre de medicamento',
                    ),
                  ),
                  TextField(
                    controller: descripcionController,
                    decoration: InputDecoration(
                      labelText: 'Cantidad',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: addMedication,
                    child: Text('Agregar medicamento'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: medication.length,
                itemBuilder: (context, index) {
                  String key = _medicationsRef
                      .push()
                      .key!; // Add the non-null assertion here
                  return Dismissible(
                    key: Key(key),
                    onDismissed: (direction) {
                      removeMedication(key);
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      title: Text(medication[index].nombre),
                      subtitle: Text(medication[index].descripcion),
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