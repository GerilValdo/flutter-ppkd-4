import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> listCategory = [
      'Buah-buahan',
      'Sayuran',
      'Elektronik',
      'Pakaian Pria',
      'Pakaian Wanita',
      'Alat Tulis Kantor',
      'Buku & Majalah',
      'Peralatan Dapur',
      'Makanan Ringan',
      'Minuman',
      'Mainan Anak',
      'Peralatan Olahraga',
      'Produk Kesehatan',
    ];
    return ListView.builder(
      itemCount: listCategory.length,
      itemBuilder: (BuildContext context, int index) {
        final item = listCategory[index];
        return ListTile(title: Text(item));
      },
    );
  }
}
