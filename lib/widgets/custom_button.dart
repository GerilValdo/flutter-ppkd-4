import 'package:flutter/material.dart';
import 'package:ppkd_batch4/config/style_text.dart';

class CustomButton extends StatelessWidget {
  final String pathImage;
  final String label;

  const CustomButton({super.key, required this.pathImage, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(80),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          border: Border.fromBorderSide(
            BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Row(
          children: [
            Image.asset(pathImage, width: 39, height: 24),
            SizedBox(width: 66),
            Text(label, style: StyleText.textButton),
          ],
        ),
      ),
    );
  }
}
