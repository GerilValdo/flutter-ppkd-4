import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListMapCategory extends StatelessWidget {
  const ListMapCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> kategori = [
      {
        'nama': 'Buah-buahan',
        'icon': FontAwesomeIcons.appleWhole,
        'color': Colors.redAccent,
      },
      {
        'nama': 'Sayuran',
        'icon': FontAwesomeIcons.carrot,
        'color': Colors.green,
      },
      {
        'nama': 'Elektronik',
        'icon': FontAwesomeIcons.tv,
        'color': Colors.blueAccent,
      },
      {
        'nama': 'Pakaian Pria',
        'icon': FontAwesomeIcons.person,
        'color': Colors.indigo,
      },
      {
        'nama': 'Pakaian Wanita',
        'icon': FontAwesomeIcons.personDress,
        'color': Colors.pinkAccent,
      },
      {
        'nama': 'Alat Tulis Kantor',
        'icon': FontAwesomeIcons.penFancy,
        'color': Colors.deepOrangeAccent,
      },
      {
        'nama': 'Buku & Majalah',
        'icon': FontAwesomeIcons.bookOpen,
        'color': Colors.brown,
      },
      {
        'nama': 'Peralatan Dapur',
        'icon': FontAwesomeIcons.utensils,
        'color': Colors.deepPurple,
      },
      {
        'nama': 'Makanan Ringan',
        'icon': FontAwesomeIcons.cookieBite,
        'color': Colors.amber,
      },
      {
        'nama': 'Minuman',
        'icon': FontAwesomeIcons.mugHot,
        'color': Colors.teal,
      },
      {
        'nama': 'Mainan Anak',
        'icon': FontAwesomeIcons.puzzlePiece,
        'color': Colors.lightBlue,
      },
      {
        'nama': 'Peralatan Olahraga',
        'icon': FontAwesomeIcons.dumbbell,
        'color': Colors.orangeAccent,
      },
      {
        'nama': 'Produk Kesehatan',
        'icon': FontAwesomeIcons.briefcaseMedical,
        'color': Colors.red,
      },
    ];
    return ListView.builder(
      itemCount: kategori.length,
      itemBuilder: (BuildContext context, int index) {
        final item = kategori[index];
        return ListTile(
          leading: Icon(item['icon'], color: item['color']),
          title: Text(item['nama']),
        );
      },
    );
  }
}
