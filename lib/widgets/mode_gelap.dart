import 'package:flutter/material.dart';

class ModeGelap extends StatefulWidget {
  const ModeGelap({super.key, required this.onChanged});
  final void Function(bool) onChanged;

  @override
  State<ModeGelap> createState() => _ModeGelapState();
}

class _ModeGelapState extends State<ModeGelap> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwitchListTile(
            title: const Text('Aktifkan Mode Gelap'),
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
              });
              widget.onChanged(value);
            },
          ),
          const SizedBox(height: 10),
          Text(
            isDark ? 'Mode Gelap Aktif' : 'Mode Terang Aktif',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}