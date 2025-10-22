import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class PilihTanggalLahir extends StatefulWidget {
  const PilihTanggalLahir({super.key});

  @override
  State<PilihTanggalLahir> createState() => _PilihTanggalLahirState();
}

class _PilihTanggalLahirState extends State<PilihTanggalLahir> {
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String formatTanggal(DateTime date) {
    return DateFormat('d MMMM yyyy', 'id_ID').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _pickDate,
            child: const Text('Pilih Tanggal Lahir'),
          ),
          const SizedBox(height: 10),
          if (selectedDate != null)
            Text(
              'Tanggal Lahir: ${formatTanggal(selectedDate!)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          else
            const Text('Belum memilih tanggal'),
        ],
      ),
    );
  }
}
