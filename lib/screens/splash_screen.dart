import 'package:flutter/material.dart';

void main() {
  runApp(Mood());
}

class Mood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoodTrackerScreen(),
    );
  }
}

class MoodTrackerScreen extends StatefulWidget {
  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  List<IconData> moods = []; // Lista para almacenar los estados de ánimo

  void _addMood(IconData mood) {
    setState(() {
      moods.add(mood);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _addMood(Icons.sentiment_satisfied);
                  },
                  child: Icon(
                    Icons.sentiment_satisfied,
                    size: 40,
                    color: Colors.green,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _addMood(Icons.sentiment_dissatisfied);
                  },
                  child: Icon(
                    Icons.sentiment_dissatisfied,
                    size: 40,
                    color: Colors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _addMood(Icons.sentiment_very_dissatisfied);
                  },
                  child: Icon(
                    Icons.sentiment_very_dissatisfied,
                    size: 40,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            Divider(),
            Text(
              'Historial de Estados de Ánimo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: moods.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(moods[index]),
                    title: Text('Estado de Ánimo ${index + 1}'),
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
