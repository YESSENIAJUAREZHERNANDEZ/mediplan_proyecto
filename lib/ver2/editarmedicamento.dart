import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:flutter_application_1/screens/splash_dos.dart';
import 'package:flutter_application_1/ver2/form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;

class Medication {
  final String id;
  final String nombre;
  final String descripcion;
  final String proposito;
  final String administracion;
  final String sheduleTime; // Nuevo campo para la hora de administración

  Medication({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.proposito,
    required this.administracion,
    required this.sheduleTime, // Agregar el campo en el constructor
  });
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Firebase.initializeApp();
  runApp(MedicationsNew());
}



class MedicationsNew extends StatefulWidget {
  void _signOut(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('isUserLoggedIn');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Splashdos(),
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
  TextEditingController propositoController = TextEditingController();
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
          Map<dynamic, dynamic> values =
              event.snapshot.value as Map<dynamic, dynamic>;
  values.forEach((key, values) {
  String nombre = values['nombre'] ?? '';
  String descripcion = values['descripcion'] ?? '';
  String proposito = values['proposito'] ?? '';
  String administracion = values['administracion'] ?? '';
  String scheduleTime = values['scheduleTime'] ?? ''; // Obtener el valor de scheduleTime

  medication.add(Medication(
    id: key,
    nombre: nombre,
    descripcion: descripcion,
    proposito: proposito,
    administracion: administracion,
    sheduleTime: scheduleTime, // Asignar el valor a la propiedad sheduleTime
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

void editMedication(BuildContext context, Medication medication) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditMedicationScreen(
        medicationsRef: _medicationsRef,
        medication: medication,
      ),
    ),
  );
}


void deleteMedication(BuildContext context, String key, medicationsRef) {
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
              medicationsRef.child(key).remove().then((_) {
                setState(() {
                  medication.removeWhere((element) => element.id == key); // Usar el ID para eliminar de la lista local
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
}



@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 254),
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
            'Recordatorios',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            '_',
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
                    primary: Color.fromARGB(255, 39, 71, 87),
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
                String key = medication[index].id;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: GestureDetector(
                        onTap: () {
                          // Tu lógica aquí...
                        },
                        child: Icon(Icons.alarm, color: Color.fromARGB(255, 124, 38, 64)),
                      ),
                      title: Text('${medication[index].nombre}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Propósito: ${medication[index].proposito}'),
                          Text('Duración de tratamiento: ${medication[index].administracion} días'),
                          Text('Hora: ${medication[index].sheduleTime}'),
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Opciones de medicamento'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => EditMedicationScreen(
                                            medicationsRef: _medicationsRef, // Reemplaza con tu referencia real
                                            medication: medication[index], // El medicamento que se va a editar
                                          ),
                                        ),
                                      );
                                    },
                                    title: Text('Editar'),
                                    leading: Icon(Icons.edit),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      deleteMedication(context, key, _medicationsRef);
                                    },
                                    title: Text('Eliminar'),
                                    leading: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
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

class EditMedicationScreen extends StatefulWidget {
  final DatabaseReference medicationsRef;
  final Medication medication;

  EditMedicationScreen({required this.medicationsRef, required this.medication});

  @override
  _EditMedicationScreenState createState() => _EditMedicationScreenState();
}

class _EditMedicationScreenState extends State<EditMedicationScreen> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController propositoController = TextEditingController();
  TextEditingController administracionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nombreController.text = widget.medication.nombre;
    descripcionController.text = widget.medication.descripcion;
    propositoController.text = widget.medication.proposito;
    administracionController.text = widget.medication.administracion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Medicamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre:'),
            TextField(controller: nombreController),
            SizedBox(height: 16),
            Text('Dosis:'),
            TextField(controller: descripcionController),
            SizedBox(height: 16),
            Text('Propósito:'),
            TextField(controller: propositoController),
            SizedBox(height: 16),
            Text('Administración:'),
            TextField(controller: administracionController),
            SizedBox(height: 16),
            ElevatedButton(
  onPressed: () {
    widget.medicationsRef.child(widget.medication.id).update({
      'nombre': nombreController.text,
      'descripcion': descripcionController.text,
      'proposito': propositoController.text,
      'administracion': administracionController.text,
    }).then((_) {
      Navigator.pop(context);
    });
  },
  child: Text('Guardar Cambios'),
),

          ],
        ),
      ),
    );
  }
} 