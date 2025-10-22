import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ppkd_batch4/config/route.dart';
import 'package:ppkd_batch4/tugas/home_screen.dart';
// import 'package:ppkd_batch4/tugas/tugas_8.dart';
import 'package:ppkd_batch4/tugas/tugas%209/tugas_9.dart';
// import 'package:ppkd_batch4/tugas/tugas_1.dart';
// import 'package:ppkd_batch4/tugas/tugas_2.dart';
//import 'package:ppkd_batch4/tugas/tugas_3.dart';
// import 'package:ppkd_batch4/tugas/tugas_4.dart';
// import 'package:ppkd_batch4/tugas/tugas_5.dart';
// import 'package:ppkd_batch4/tugas/tugas_slicing_mpro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
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
      routes: {RouteScreen.home.path: (context) => HomeScreen()},
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
      home: Tugas9(),
    );
  }
}
