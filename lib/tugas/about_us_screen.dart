import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  FontAwesomeIcons.circleInfo,
                  size: 60,
                  color: Colors.blueAccent,
                ),
                SizedBox(height: 16),
                Text(
                  'Form Interaktif Flutter',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Aplikasi ini dibuat untuk menampilkan berbagai jenis input interaktif di Flutter seperti Checkbox, Switch, Dropdown, DatePicker, dan TimePicker dengan navigasi Drawer dan BottomNavigationBar.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Divider(),
                Text('Dibuat oleh: Geril Valdo'),
                Text('Versi: 1.0.0'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
