import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ColoresCalendar extends StatefulWidget {
  @override
  _ColoresCalendarState createState() => _ColoresCalendarState();
}

class _ColoresCalendarState extends State<ColoresCalendar> {
  DateRangePickerController _datePickerController =
      DateRangePickerController();

  bool blockGestures = true; // Variable para controlar el bloqueo de gestos

  @override
  initState() {
    _datePickerController.selectedRanges = <PickerDateRange>[
      PickerDateRange(
          DateTime(2023, 12, 01).subtract(Duration(days: 4)),
          DateTime.now().add(Duration(days: 4))),
      PickerDateRange(DateTime.now().add(Duration(days: 11)),
          DateTime.now().add(Duration(days: 16)))
    ];
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
          absorbing: blockGestures, // true para bloquear, false para permitir
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.multiRange,
            controller: _datePickerController,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              blockGestures = !blockGestures; // Cambia el estado de bloqueo
            });
          },
          child: Icon(Icons.block), // Icono para cambiar el bloqueo
        ),
      ),
    );
  }
}
