import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ppkd_batch4/tugas/about_us_screen.dart';
import 'package:ppkd_batch4/tugas/tugas_7.dart';

class Tugas8 extends StatefulWidget {
  const Tugas8({super.key, required this.onChanged});
  final void Function(bool) onChanged;

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
  int selectedIndex = 0;

  final List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages.addAll([Tugas7(onChanged: widget.onChanged), const AboutUsScreen()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: (index) => setState(() => selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.houseUser),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circleInfo),
            label: 'About Us',
            tooltip: 'About Us',
          ),
        ],
      ),
    );
  }
}






