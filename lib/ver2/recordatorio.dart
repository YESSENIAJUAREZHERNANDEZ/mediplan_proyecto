import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(RecordatoriosNew());
}

class RecordatoriosNew extends StatelessWidget {
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

  DatabaseReference _remindersRef = FirebaseDatabase.instance.reference().child('reminders');

  @override
  void initState() {
    super.initState();
    _fetchReminders();
  }

  void _fetchReminders() {
    _remindersRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        List<Reminder> fetchedReminders = [];
        Map<dynamic, dynamic> values = event.snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, values) {
          fetchedReminders.add(Reminder(
            name: values['name'],
            dateTime: DateTime.parse(values['dateTime']),
          ));
        });
        setState(() {
          reminders = fetchedReminders;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Reminder> remindersToShow = reminders.where((reminder) {
      // Filtrar los recordatorios que deben mostrarse
      // Puedes agregar tu lógica de filtrado aquí
      return true; // Cambia esto con tu lógica de filtrado
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recordatorios'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: remindersToShow.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text('Dosis: ${remindersToShow[index].name}'),
                    subtitle: Text(
                      'Fecha y hora: ${remindersToShow[index].dateTime.toString()}',
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddReminderScreen(),
                ),
              );
            },
            child: Text('Agregar Recordatorio'),
          ),
        ],
      ),
    );
  }
}
class AddReminderScreen extends StatefulWidget {
  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final TextEditingController _nameController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Recordatorio'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nombre del Recordatorio',
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Fecha y Hora:',
                  style: TextStyle(fontSize: 16.0),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    '${selectedDate.toLocal()}'.split(' ')[0],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes guardar los datos ingresados en Firebase o donde desees
                String name = _nameController.text;
                DateTime dateTime = selectedDate;
                // Realizar acciones con los datos ingresados (guardar en Firebase, etc.)
                // ...
                Navigator.pop(context); // Vuelve a la pantalla anterior
              },
              child: Text('Guardar Recordatorio'),
            ),
          ],
        ),
      ),
    );
  }
}


class Reminder {
  final String name;
  final DateTime dateTime;

  Reminder({required this.name, required this.dateTime});
}
