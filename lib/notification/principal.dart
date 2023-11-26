import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'Services/notifi_service.dart';
import 'homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  runApp(const GOD());
}

class GOD extends StatelessWidget {
  const GOD({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notifications',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Aver(title: 'Flutter Local Notifications'),
    );
  }
}