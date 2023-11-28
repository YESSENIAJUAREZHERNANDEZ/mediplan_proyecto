import 'package:flutter/material.dart';

class AddReminderForm extends StatefulWidget {
  final List<Note> medications;
  final Function(String, String, String) onSaveReminder;

  AddReminderForm({
    required this.medications,
    required this.onSaveReminder,
  });

  @override
  _AddReminderFormState createState() => _AddReminderFormState();
}

class _AddReminderFormState extends State<AddReminderForm> {
  late String selectedMedication;
  late String dosis;
  late String frecuencia;

  @override
  void initState() {
    super.initState();
    if (widget.medications.isNotEmpty) {
      selectedMedication = widget.medications[0].content;
    } else {
      selectedMedication = 'Sin medicamentos';
    }
    frecuencia = 'Cada 1 hora';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            value: selectedMedication,
            onChanged: (newValue) {
              setState(() {
                selectedMedication = newValue!;
              });
            },
            items: widget.medications.map((Note medication) {
              return DropdownMenuItem<String>(
                value: medication.content,
                child: Text(medication.content),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'Medicamento',
              filled: true,
              fillColor: Color.fromARGB(255, 220, 233, 240),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              dosis = value;
            },
            decoration: InputDecoration(
              labelText: 'Dosis',
              filled: true,
              fillColor: Color.fromARGB(255, 220, 233, 240),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: frecuencia,
            onChanged: (newValue) {
              setState(() {
                frecuencia = newValue!;
              });
            },
            items: <String>[
              'Cada 1 hora',
              'Cada 6 horas',
              'Cada 8 horas',
              'Cada 12 horas',
              'Cada 24 horas',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'Frecuencia',
              filled: true,
              fillColor: Color.fromARGB(255, 220, 233, 240),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onSaveReminder(selectedMedication, dosis, frecuencia);
              Navigator.pop(context);
            },
            child: Text('Agregar'),
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
