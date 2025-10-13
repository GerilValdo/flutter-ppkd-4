import 'package:flutter/material.dart';
// import 'package:ppkd_batch4/tugas/tugas_1.dart';
import 'package:ppkd_batch4/tugas/tugas_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;
  void toggleTheme(bool isDark) {
    setState(() {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
          bodySmall: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
      themeMode: themeMode,
      title: 'Tugas 1 Flutter',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade300),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
          bodySmall: TextStyle(color: Colors.black, fontSize: 12),
        ),
        primarySwatch: Colors.blue,
      ),
      home: Tugas2(onChanged: toggleTheme),
    );
  }
}
