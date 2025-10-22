import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ppkd_batch4/widgets/atur_pengingat.dart';
import 'package:ppkd_batch4/widgets/dropdown_widget.dart';
import 'package:ppkd_batch4/widgets/mode_gelap.dart';
import 'package:ppkd_batch4/widgets/pilih_tanggal_lahir.dart';
import 'package:ppkd_batch4/widgets/syarat_ketentuan.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key, required this.onChanged});
  final void Function(bool) onChanged;

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> drawerItems = [
    {
      'icon': FontAwesomeIcons.squareCheck,
      'color': Colors.green,
      'title': 'Syarat & Ketentuan',
    },
    {
      'icon': FontAwesomeIcons.toggleOn,
      'color': Colors.lightBlueAccent,
      'title': 'Mode Gelap',
    },
    {
      'icon': FontAwesomeIcons.caretDown,
      'color': Colors.indigo,
      'title': 'Pilih Kategori Produk',
    },
    {
      'icon': FontAwesomeIcons.calendarDays,
      'color': Colors.deepOrangeAccent,
      'title': 'Pilih Tanggal Lahir',
    },
    {
      'icon': FontAwesomeIcons.clock,
      'color': Colors.deepOrangeAccent,
      'title': 'Atur Pengingat',
    },
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
      const SyaratKetentuan(),
      ModeGelap(onChanged: widget.onChanged),
      const DropdownWidget(),
      const PilihTanggalLahir(),
      const AturPengingat(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tugas 7'), centerTitle: true),
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
            ...drawerItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return ListTile(
                leading: Icon(item['icon'], color: item['color']),
                title: Text(item['title']),
                onTap: () => onTapDrawer(index),
              );
            }),
          ],
        ),
      ),
      body: SafeArea(child: viewBody[selectedIndex]),
    );
  }
}
