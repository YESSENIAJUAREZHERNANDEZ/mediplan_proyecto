import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  late String fechaFromFirebase = ''; // Variable para almacenar el campo 'fecha'
  int year = 0; // Variable para almacenar el año
  int month = 0; // Variable para almacenar el mes
  int day = 0; // Variable para almacenar el día

  DatabaseReference _medicationsRef =
      FirebaseDatabase.instance.reference().child('medications');

  @override
  void initState() {
    super.initState();
    // Inicializa la variable fechaFromFirebase
    _loadFechaFromFirebase();
  }

  void _loadFechaFromFirebase() {
  _medicationsRef.child('-NkmImnJ4u_sUxFN_jUc').child('administracion').onValue.listen((event) {
    if (event.snapshot.value != null) {
      int daysToAdd = int.parse(event.snapshot.value.toString());

      _medicationsRef.child('-NkmImnJ4u_sUxFN_jUc').child('fecha').onValue.listen((eventFecha) {
        if (eventFecha.snapshot.value != null) {
          setState(() {
            String fechaFromFirebase = eventFecha.snapshot.value.toString();

            // Convierte la cadena de fecha en un objeto DateTime
            DateTime dateTime = DateTime.parse(fechaFromFirebase);
            // Obtén el año, mes y día del objeto DateTime
            int year = dateTime.year;
            int month = dateTime.month;
            int day = dateTime.day;

            // Suma los días obtenidos del campo 'administracion' al día
            DateTime newDate = dateTime.add(Duration(days: daysToAdd));

            // Almacena la nueva fecha en nuevas variables year, month y day
            int newYear = newDate.year;
            int newMonth = newDate.month;
            int newDay = newDate.day;

            // Actualiza el rango de fecha en el SfDateRangePicker con la nueva fecha
             _datePickerController.selectedRange =
              PickerDateRange(DateTime(year, month, day), DateTime(newYear, newMonth, newDay));
          });
        }
      }, onError: (Object? error) {
        // Manejar cualquier error que pueda ocurrir al obtener el campo 'fecha' desde Firebase
        print('Error al obtener el campo fecha desde Firebase: $error');
      });
    }
  }, onError: (Object? error) {
    // Manejar cualquier error que pueda ocurrir al obtener el campo 'administracion' desde Firebase
    print('Error al obtener el campo administracion desde Firebase: $error');
  });
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
            // Muestra el valor del campo 'fecha' obtenido desde Firebase y separado en año, mes y día
            //Text('Fecha desde Firebase: $fechaFromFirebase'),
            Text(
            'Medicación del mes',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 5),
          Text('Calendario de tratamiento'),
            SizedBox(height: 20),
            //Text('Año: $year, Mes: $month, Día: $day'),
            // Muestra el SfDateRangePicker debajo de los textos anteriores
            Expanded(
              child: AbsorbPointer(
                absorbing: blockGestures, // Controla la absorción de gestos
                child: SfDateRangePicker(
                view: DateRangePickerView.month,
                selectionMode: DateRangePickerSelectionMode.range,
                selectionShape: DateRangePickerSelectionShape.rectangle,
                rangeSelectionColor: Colors.lightGreen,
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
          backgroundColor: Colors.transparent, // Cambiar el color de fondo a blanco
          foregroundColor: Colors.transparent,
          elevation: 0.0,
          highlightElevation: 0.0, // Eliminar la elevación al presionar
          splashColor: Colors.transparent, // Establecer el color de resaltado a transparente
          child: Icon(Icons.block),
        ),
      ),
    );
  }
}
