import 'package:flutter/material.dart';
import 'package:ppkd_batch4/tugas/tugas_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 1 Flutter',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 20),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
          bodySmall: TextStyle(color: Colors.black, fontSize: 12),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Tugas1(),
    );
  }
}
