import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(CalendarScreen());
}

class Event {
  final DateTime date;

  Event(this.date);
}

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<Event> events = [];

  void _showAddEventDialog(BuildContext context, DateTime selectedDate) {
    TextEditingController _eventController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Evento'),
          content: TextField(
            controller: _eventController,
            decoration: InputDecoration(labelText: 'Nombre del Evento'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Guardar'),
              onPressed: () {
                String eventName = _eventController.text;
                events.add(Event(selectedDate));
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool _isDateWithEvent(DateTime date) {
    return events.any((event) =>
        DateFormat('dd/MM/yyyy').format(event.date) ==
        DateFormat('dd/MM/yyyy').format(date));
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Center(
                child: Text(
                  'Calendario de tratamiento',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.single,
                initialSelectedDate: DateTime.now(),
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  if (args.value is DateTime) {
                    _showAddEventDialog(context, args.value);
                  }
                },
                cellBuilder: (BuildContext context,
                    DateRangePickerCellDetails details) {
                  DateTime date = details.date;
                  bool hasEvent = _isDateWithEvent(date);
                  return Container(
                    color: hasEvent ? Colors.green.withOpacity(0.3) : null,
                    child: Center(
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: hasEvent ? Colors.black : Colors.black54,
                        ),
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
