import 'package:flutter/material.dart';
import 'package:flutter_application_1/text/home_page.dart';

import 'package:timezone/data/latest.dart' as tz;

void main() async{
  tz.initializeTimeZones();
  (const Plan());
}

class Plan extends StatelessWidget {
  const Plan({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}