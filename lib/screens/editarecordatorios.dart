import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Recordatorios());
}

class Recordatorios extends StatelessWidget {
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
final databaseReference = FirebaseDatabase.instance.reference();
class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> notes = [];
  TextEditingController _textEditingController = TextEditingController();

  void _addNote() {
    String content = _textEditingController.text;
    if (content.isNotEmpty) {
      setState(() {
        notes.add(Note(
          content: content,
        ));
        _textEditingController.clear();
      });

      // Push the new reminder to the database
      databaseReference.child("reminders").push().set({
        "content": content,
      });
    }
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
                    Text(
                  'Recordatorios',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.yellow[100],
                  child: ListTile(
                    title: Text(notes[index].content),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteNote(index),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Ingresar recordatorio',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addNote,
                  child: Text('Agregar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Note {
  final String content;

  Note({required this.content});
}

