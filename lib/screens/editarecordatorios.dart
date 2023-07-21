import 'package:flutter/material.dart';

void main() {
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

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> notes = [];
  TextEditingController _textEditingController = TextEditingController();

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
                      hintText: 'Enter a note',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addNote,
                  child: Text('Add'),
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

