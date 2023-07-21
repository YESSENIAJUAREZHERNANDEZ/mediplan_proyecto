import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:flutter_application_1/screens/resultadotrata.dart';

class Medication2 {
  final String nombre;
  final String descripcion;

  Medication2({required this.nombre, required this.descripcion});
}

class Medications2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Medications2> {
  List<Medication2> medication = [];
  int currentDose = 0;
  int totalDoses = 10;

  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController dosesController = TextEditingController();

  void addMedication() {
    String nombre = nombreController.text;
    String descripcion = descripcionController.text;

    if (nombre.isNotEmpty && descripcion.isNotEmpty) {
      setState(() {
        medication.add(Medication2(nombre: nombre, descripcion: descripcion));
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

  double calculateDoseProgress() {
    return (currentDose / totalDoses) * 100;
  }

  void administerDoses() {
    int dosesToAdminister = int.tryParse(dosesController.text) ?? 0;
    setState(() {
      currentDose += dosesToAdminister;
      dosesController.clear();
    });
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
            icon: Icon(Icons.arrow_back, color: Colors.black), // Custom back button icon
            onPressed: () {
              // Navigate back to the previous screen manually
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
                title: Text(
                  'Iniciar sesión',
                  style: TextStyle(color: Color.fromARGB(255, 48, 24, 49), fontSize: 16),
                ),
                onTap: () {
                  // Acción para la opción 1
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Terminos y condiciones',
                  style: TextStyle(color: Color.fromARGB(255, 48, 24, 49), fontSize: 16),
                ),
                onTap: () {
                  // Acción para la opción 2
                },
              ),
              ListTile(
                title: Text(
                  'Ayuda',
                  style: TextStyle(color: Color.fromARGB(255, 48, 24, 49), fontSize: 16),
                ),
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
                    child: Text('Agregar medicamento'),
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
            Text(
              'Porcentaje de avance basado en dosis:',
            ),
            Text(
              '${calculateDoseProgress().toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: TextField(
                controller: dosesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Dosis a administrar'),
              ),
            ),
            ElevatedButton(
              child: Text('Administrar dosis'),
              onPressed: administerDoses,
            ),
            ElevatedButton(
              child: Text('Ver Barra de Progreso'),
              onPressed: () {
                double percentage = calculateDoseProgress();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgressBarScreen(percentage),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
