import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ColoresCalendar extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<ColoresCalendar> {
  DateRangePickerController _datePickerController = DateRangePickerController();

   @override
  initState() {
    _datePickerController.selectedRange =
        PickerDateRange(DateTime(2023, 12, 01), DateTime(2023, 12, 05));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DateRangePicker Demo'),
        ),
        body: SfDateRangePicker(
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.range,
          controller: _datePickerController,
          startRangeSelectionColor: Colors.green,
          endRangeSelectionColor: Colors.red,
          rangeSelectionColor: Color.fromARGB(255, 157, 185, 228),
        ),
      ),
    );
  }
}