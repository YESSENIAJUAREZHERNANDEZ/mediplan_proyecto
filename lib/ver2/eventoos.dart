import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Medication {
  final String id; 
  final String nombre; // Por si acaso
  final String fecha;
  final String administracion;
  Medication({
    required this.id,
    required this.nombre, 
    required this.fecha,
    required this.administracion,
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ColoresCalendar());
}


class ColoresCalendar extends StatefulWidget {
  @override
  _ColoresCalendarState createState() => _ColoresCalendarState();
}

class _ColoresCalendarState extends State<ColoresCalendar> {
   DateRangePickerController _datePickerController = DateRangePickerController();

  bool blockGestures = true;
  List<Medication> medication = [];
  DatabaseReference _medicationsRef =
      FirebaseDatabase.instance.reference().child('medications');

  @override
  initState() {
    // Lógica para obtener la fecha legible desde Firebase y dividirla en sus componentes


    String firebaseDate = "2023-12-03"; // Aquí obtendrás la fecha de Firebase
    List<String> dateComponents = firebaseDate.split('-');
    int year = int.parse(dateComponents[0]);
    int month = int.parse(dateComponents[1]);
    int day = int.parse(dateComponents[2]);

    // Usar los componentes de fecha en el SfDateRangePicker
    _datePickerController.selectedRange =
        PickerDateRange(DateTime(year, month, day), DateTime(2023, 12, 05));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: AbsorbPointer(
          absorbing: blockGestures,
          child: SfDateRangePicker(
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.range,
          controller: _datePickerController,
        ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              blockGestures = !blockGestures;
            });
          },
          child: Icon(Icons.block),
        ),
      ),
    );
  }
}