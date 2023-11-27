import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:flutter_application_1/screens/splash_dos.dart';
import 'package:flutter_application_1/ver2/form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Medication {
  final String nombre;
  final String descripcion;
  final String proposito;
  final String administracion;

  Medication({required this.nombre, required this.descripcion, required this.proposito, required this.administracion});
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MedicationsNew());
}

class MedicationsNew extends StatefulWidget {
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

class _MedicationsAppState extends State<MedicationsNew> {
  List<Medication> medication = [];
  int _counter = 0;

  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController propositoController= TextEditingController();
  TextEditingController administracionController = TextEditingController();

  DatabaseReference _medicationsRef =
      FirebaseDatabase.instance.reference().child('medications');

  @override
void initState() {
  super.initState();
  _medicationsRef.onValue.listen((event) {
    if (event.snapshot.value != null) {
      setState(() {
        medication.clear();
        Map<dynamic, dynamic> values = event.snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, values) {
          String nombre = values['nombre'] ?? ''; // Verificación para evitar valores nulos
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
}




  void addMedication(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddMedicationScreen(medicationsRef: _medicationsRef),
    ),
  );
}



@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 238, 248), // Fondo azul
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
      body: Column(
        children: [
          Text(
            'Medicamentos',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            '___',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => addMedication(context),
                  child: Text(
                    'Agregar medicamento',
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
Expanded(
  child: ListView.builder(
  itemCount: medication.length,
  itemBuilder: (context, index) {
    String key = _medicationsRef.push().key!;
    return Column(
      children: [
        ListTile(
          leading: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Eliminar medicamento'),
                    content: Text('¿Seguro que quiere eliminar este medicamento?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cerrar el diálogo
                        },
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          _medicationsRef.child(key).remove().then((_) {
                            setState(() {
                              medication.removeAt(index);
                              Navigator.of(context).pop(); // Cerrar el diálogo después de eliminar
                            });
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
            },
            child: Icon(Icons.medical_services, color: Colors.green,),
          ),
          title: Text('${medication[index].nombre}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Propósito: ${medication[index].proposito}'),
              Text('Vía de Administración: ${medication[index].administracion}'),
            ],
          ),
        ),
        Divider(),
      ],
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