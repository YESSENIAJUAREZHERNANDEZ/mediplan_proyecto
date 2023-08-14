import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(CalendarScreen());
}

class CalendarScreen extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<CalendarScreen> {
  String _selectedDate = '';
  String _range = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} - ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = DateFormat('dd/MM/yyyy').format(args.value);
      }
    });
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
                title: Text(
                  'Información de la cuenta',
                  style: TextStyle(
                    color: Color.fromARGB(255, 48, 24, 49),
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    color: Color.fromARGB(255, 48, 24, 49),
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  // Call logout function
                },
              ),
              ListTile(
                title: Text(
                  '',
                  style: TextStyle(
                    color: Color.fromARGB(255, 48, 24, 49),
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  // Action for option 3
                },
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
              child: Text(
                'Periodo de medicación del mes',
                style: TextStyle(
                  color: Color.fromARGB(255, 85, 42, 87),
                  fontSize: 16,
                ),
              ),
            ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(const Duration(days: 4)),
                  DateTime.now().add(const Duration(days: 3)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Días de tratamiento : $_selectedDate',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Inicio un: $_range',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
