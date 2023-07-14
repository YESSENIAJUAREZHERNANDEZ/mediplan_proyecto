import 'package:flutter/material.dart';

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
            onPressed: () {
              Navigator.pop(context);
            },
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



  // Resto del contenido de la pantalla
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.yellow[100], // Color de fondo de la tarjeta
                  child: ListTile(
                    title: Text(notes[index].content),
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
                  onPressed: () {
                    setState(() {
                      notes.add(Note(
                        content: _textEditingController.text,
                      ));
                      _textEditingController.clear();
                    });
                  },
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