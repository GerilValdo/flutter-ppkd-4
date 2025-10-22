import 'package:flutter/material.dart';

class AturPengingat extends StatefulWidget {
  const AturPengingat({super.key});

  @override
  State<AturPengingat> createState() => _AturPengingatState();
}

class _AturPengingatState extends State<AturPengingat> {
  TimeOfDay? selectedTime;

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _pickTime,
            child: const Text('Pilih Waktu Pengingat'),
          ),
          const SizedBox(height: 10),
          if (selectedTime != null)
            Text(
              'Pengingat diatur pukul: ${selectedTime!.format(context)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}