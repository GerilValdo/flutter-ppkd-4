import 'package:flutter/material.dart';

class Tugas1 extends StatefulWidget {
  const Tugas1({super.key, required this.onChanged});
  final void Function(bool) onChanged;

  @override
  State<Tugas1> createState() => _Tugas1State();
}

class _Tugas1State extends State<Tugas1> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 16),
        actions: [
          Switch(
            activeThumbColor: Colors.blue,
            value: isDark,
            onChanged: widget.onChanged,
          ),
        ],
        title: Text(
          'Profil Saya',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/id/64/200/300',
                  ),
                ),
                Text(
                  'Nama: Geril Valdo Jatsiah Manday',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: isDark ? Colors.white : Colors.blue,
                    ),
                    Text(
                      'Jakarta',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Text(
                  'Seorang pelajar yang sedang belajar Flutter.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
