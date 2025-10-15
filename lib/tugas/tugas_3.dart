import 'package:flutter/material.dart';
import 'package:ppkd_batch4/widgets/custom_text_field.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    final List listColor = [
      Color(0xFF5D688A),
      Color(0xFFF7A5A5),
      Color(0xFFFFDBB6),
      Color(0xFFFFF2EF),
      Color(0xFF896C6C),
      Color(0xFFE5BEB5),
    ];
    return Scaffold(
      backgroundColor: Color(0xFFBADFDB),
      appBar: AppBar(
        title: Text(
          'Tugas 3 Flutter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                CustomTextField('Nama', textInputType: TextInputType.name),
                SizedBox(height: 10),
                CustomTextField(
                  'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                CustomTextField('No. HP', textInputType: TextInputType.phone),
                SizedBox(height: 10),
                CustomTextField(
                  'Deskripsi',
                  textInputType: TextInputType.streetAddress,
                  minLines: 5,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(listColor.length, (index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                    color: listColor[index],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Text(
                        'Container ${index + 1}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
