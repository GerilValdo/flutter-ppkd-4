import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class Tugas2 extends StatefulWidget {
  const Tugas2({super.key, required this.onChanged});
  final void Function(bool) onChanged;

  @override
  State<Tugas2> createState() => _Tugas21State();
}

class _Tugas21State extends State<Tugas2> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 16),
        actions: [
          Switch.adaptive(
            thumbIcon: WidgetStateProperty.resolveWith<Icon?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return Icon(
                  Icons.nightlight_round,
                  size: 18,
                  color: Colors.white,
                );
              }
              return Icon(Icons.wb_sunny, size: 18, color: Colors.orangeAccent);
            }),
            activeThumbColor: Colors.blueAccent,
            value: isDark,
            onChanged: widget.onChanged,
          ),
        ],
        title: Text(
          'Profil Lengkap',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/pikachu.webp'),
              ),
              SizedBox(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 10,
                      children: [
                        Center(
                          child: Text(
                            'Geril Valdo Jatsiah Manday',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.envelope),
                              SizedBox(width: 10),
                              Text('gerilmanday@gmail.com'),
                              Spacer(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.mobileScreen),
                              SizedBox(width: 10),
                              Text('+62 812-3456-7890'),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '100',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Postingan',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '1.2 K',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Followers',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      border: DashedBorder.fromBorderSide(
                        side: BorderSide(
                          color: isDark
                              ? Colors.grey.shade300
                              : Colors.grey.shade600,
                          width: 3,
                        ),
                        dashLength: 10,
                      ),
                    ),
                    padding: EdgeInsetsGeometry.all(10),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple,
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.orange,
                      Colors.red,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
