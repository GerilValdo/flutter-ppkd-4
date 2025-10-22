import 'package:flutter/material.dart';
import 'package:ppkd_batch4/tugas/tugas%209/list_category.dart';
import 'package:ppkd_batch4/tugas/tugas%209/list_map_category.dart';
import 'package:ppkd_batch4/tugas/tugas%209/list_model_book.dart';
import 'package:ppkd_batch4/tugas/tugas%209/list_model_majalah.dart';

class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});

  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
  int selectedIndex = 0;
  List<String> listBody = [
    'List Category',
    'List Map Category',
    'List Model Buku',
    'List Mode Majalah',
  ];

  void onTapDrawer(int index) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.pop(context);
  }

  late final List<Widget> viewBody;

  @override
  void initState() {
    super.initState();
    viewBody = [
      const ListCategory(),
      const ListMapCategory(),
      const ListModelBook(),
      const ListModelMajalah(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tugas 9 Flutter')),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pikachu.webp'),
              ),
              accountName: Text('Geril Valdo'),
              accountEmail: Text('gerilmanday@gmail.com'),
            ),
            ...List.generate(listBody.length, (index) {
              final item = listBody[index];
              return ListTile(
                title: Text(item),
                onTap: () => onTapDrawer(index),
              );
            }),
          ],
        ),
      ),
      body: viewBody[selectedIndex],
    );
  }
}
