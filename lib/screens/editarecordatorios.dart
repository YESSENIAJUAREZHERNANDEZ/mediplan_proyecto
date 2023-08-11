import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:flutter_application_1/screens/splash_dos.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(Recordatorios());
}

class Recordatorios extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteListScreen(),
      
    );
  }
}

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  
  List<Reminder> reminders = [];
  int selectedMedicationIndex = -1; // Valor inicial para indicar que no se ha seleccionado ninguna medicación


  void addReminder(String name, DateTime dateTime) {
    setState(() {
      reminders.add(Reminder(name: name, dateTime: dateTime));
    });
  }

  List<Note> notes = [];
  String frecuencia = 'Cada 1 hora';
  TextEditingController _textEditingController = TextEditingController();

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
        List<Note> medications = [];
        Map<dynamic, dynamic> values =
            event.snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, values) {
          medications.add(Note(
            content: "${values['nombre']}",
            //}: ${values['descripcion']
          ));
        });
        setState(() {
          notes = medications;
        });
      }
    });
  }

  void _addNote() {
    setState(() {
      notes.add(Note(
        content: _textEditingController.text,
      ));
      _textEditingController.clear();
    });
  }

  void _deleteNote(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar nota'),
          content: Text('¿Seguro que quieres eliminar esta nota?'),
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
                  notes.removeAt(index);
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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 238, 248), // Fondo azul
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
            'Recordatorios',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 16), 
            Text(
              '___',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey, // Cambiar el color de letra a gris
              ),
              textAlign: TextAlign.left, // Alinear el texto a la izquierda
            ),
          Column(
  children: [
    for (int index = 0; index < notes.length; index++)
      Card(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            ListTile(
              title: Text(notes[index].content),
              trailing: IconButton(
                icon: Icon(Icons.timer),
                onPressed: () {
                  _showAddReminderDialog(context);
                },
                color: Color.fromARGB(255, 95, 142, 212),
              ),
            ),
            if (index < reminders.length)
              ListTile(
                title: Text('Toma establecida: $frecuencia'), // Cambio aquí
                subtitle: Text(
                  '${reminders[index].dateTime.toString()}'),
              ),
          ],
        ),
      ),
  ],
)

         // AQUÍ IRÍA EL PADDING -notas-
        ],
      ),
    );
  }


    Future<void> _showAddReminderDialog(BuildContext context) async {
    String name = '';
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar recordatorio'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(labelText: 'Dosis: ',
                filled: true, // Habilitar el fondo relleno
                      fillColor: Color.fromARGB(255, 220, 233, 240), // Color de fondo blanco
                      border: OutlineInputBorder( // Borde redondeado
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none, // Sin borde
                      ),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: frecuencia, // Valor actualmente seleccionado.
                onChanged: (newValue) {
                  setState(() {
                    frecuencia = newValue!;
                  });
                },
                items: <String>[
                  'Cada 1 hora',
                  'Cada 3 horas',
                  'Cada 6 horas',
                  'Cada 12 horas',
                  'Cada 24 horas',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Frecuencia: ',
                filled: true, // Habilitar el fondo relleno
                      fillColor: Color.fromARGB(255, 220, 233, 240), // Color de fondo blanco
                      border: OutlineInputBorder( // Borde redondeado
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none, // Sin borde
                      ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 220, 233, 240),  // Color de fondo 
                        borderRadius: BorderRadius.circular(10.0),  // Bordes redondeados
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'A partir: ${selectedDate.toString().substring(0, 10)}',
                        ),
                      ),
                    ),
                  ),
                ),

                  SizedBox(width: 8),
                  Expanded(
                  child: InkWell(
                    onTap: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                      );
                      if (pickedTime != null) {
                        setState(() {
                          selectedTime = pickedTime;
                        });
                      }
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 220, 233, 240),  // Color de fondo
                        borderRadius: BorderRadius.circular(10.0),  // Bordes redondeados
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Desde: ${selectedTime.format(context)}',
                        ),
                      ),
                    ),
                  ),
                ),

                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Agregar'),
              onPressed: () {
                if (name.isNotEmpty) {
                  addReminder(name, DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  ));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

}

class Note {
  final String content;

  Note({required this.content});
}

class Reminder {
  final String name;
  final DateTime dateTime;

  Reminder({required this.name, required this.dateTime});
}
