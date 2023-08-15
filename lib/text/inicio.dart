import 'package:flutter/material.dart';
import 'package:flutter_application_1/text/home_page.dart';

void main() => runApp(const Plan());

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