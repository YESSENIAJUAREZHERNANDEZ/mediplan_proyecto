import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ColoresCalendar());
}

class Medication {
  final String id;
  final String nombre;
  final String administracion;
  final String fecha;
  final String proposito;

  Medication(this.id, this.nombre, this.administracion, this.fecha, this.proposito);
}

class ColoresCalendar extends StatefulWidget {
  @override
  _ColoresCalendarState createState() => _ColoresCalendarState();
}

class _ColoresCalendarState extends State<ColoresCalendar> {
  DateRangePickerController _datePickerController = DateRangePickerController();
  bool blockGestures = true;
  late List<Medication> medications = [];
  late Medication selectedMedication = Medication('', '', '', '', ''); // Valores predeterminados vacíos

  late DatabaseReference _medicationsRef;

  @override
  void initState() {
    super.initState();
    _medicationsRef = FirebaseDatabase.instance.reference().child('medications');
    _loadMedicationsFromFirebase();
  }

Future<void> _loadMedicationsFromFirebase() async {
  try {
    DataSnapshot snapshot = await _medicationsRef.once().then((event) => event.snapshot);
    if (snapshot.value != null) {
      Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>?; // Uso de as para realizar un cast
      if (values != null) {
        values.forEach((key, value) {
          medications.add(
            Medication(
              key,
              value['nombre'],
              value['administracion'],
              value['fecha'],
              value['proposito'],
            ),
          );
        });
        if (medications.isNotEmpty) {
          setState(() {
            selectedMedication = medications[0];
            _loadFechaFromFirebase(selectedMedication);
          });
        }
      }
    }
  } catch (error) {
    print('Error al obtener medicamentos: $error');
  }
}


  Future<void> _loadFechaFromFirebase(Medication medication) async {
    try {
      int daysToAdd = int.parse(medication.administracion);

      DateTime dateTime = DateTime.parse(medication.fecha);
      int year = dateTime.year;
      int month = dateTime.month;
      int day = dateTime.day;

      DateTime newDate = dateTime.add(Duration(days: daysToAdd));
      int newYear = newDate.year;
      int newMonth = newDate.month;
      int newDay = newDate.day;

      setState(() {
        _datePickerController.selectedRange = PickerDateRange(
          DateTime(year, month, day),
          DateTime(newYear, newMonth, newDay)
        );
      });
    } catch (error) {
      print('Error al cargar fecha del medicamento: $error');
    }
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Medicación del mes',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 16),
            DropdownButton<Medication>(
              value: selectedMedication,
              onChanged: (Medication? newValue) {
                setState(() {
                  selectedMedication = newValue!;
                  _loadFechaFromFirebase(selectedMedication);
                });
              },
              items: medications.map<DropdownMenuItem<Medication>>((Medication medication) {
                return DropdownMenuItem<Medication>(
                  value: medication,
                  child: Text(medication.nombre),
                );
              }).toList(),
            ),
            Expanded(
              child: AbsorbPointer(
                absorbing: blockGestures,
                child: SfDateRangePicker(
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.range,
                  selectionShape: DateRangePickerSelectionShape.rectangle,
                  startRangeSelectionColor: Color.fromARGB(255, 78, 157, 196),
                  rangeSelectionColor: Color.fromARGB(255, 188, 176, 230),
                  endRangeSelectionColor: Colors.transparent,
                  selectionTextStyle: const TextStyle(color: Colors.black),
                  controller: _datePickerController,
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              blockGestures = !blockGestures;
            });
          },
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          elevation: 0.0,
          highlightElevation: 0.0,
          splashColor: Colors.transparent,
          child: Icon(Icons.block),
        ),
      ),
    );
  }
}
