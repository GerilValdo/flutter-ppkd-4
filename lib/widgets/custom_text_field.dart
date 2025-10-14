import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool obsecureText;
  final FormFieldValidator? validator;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  const CustomTextField(
    String this.hintText, {
    super.key,
    this.obsecureText = false,
    this.textInputType,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      minLines: minLines,
      controller: controller,
      obscureText: obsecureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
