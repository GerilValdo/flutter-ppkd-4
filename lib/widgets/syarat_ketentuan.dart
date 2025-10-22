import 'package:flutter/material.dart';

class SyaratKetentuan extends StatefulWidget {
  const SyaratKetentuan({super.key});

  @override
  State<SyaratKetentuan> createState() => _SyaratKetentuanState();
}

class _SyaratKetentuanState extends State<SyaratKetentuan> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CheckboxListTile(
            title: const Text('Saya menyetujui semua persyaratan yang berlaku'),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
          const SizedBox(height: 10),
          Text(
            isChecked
                ? 'Lanjutkan pendaftaran diperbolehkan'
                : 'Anda belum bisa melanjutkan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isChecked ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
