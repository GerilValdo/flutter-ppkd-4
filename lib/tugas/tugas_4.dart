import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ppkd_batch4/widgets/custom_text_field.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    String getRandomPrice() {
      final random = Random();
      int randomNumber = 50000 + random.nextInt(2000000 - 50000);
      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp',
        decimalDigits: 0,
      );
      return formatCurrency.format(randomNumber);
    }

    final List iconColor = [
      Colors.indigoAccent,
      Colors.brown.shade400,
      Colors.deepPurpleAccent,
      Colors.blueAccent,
      Colors.cyan.shade600,
      Colors.pinkAccent,
      Colors.amber.shade700,
      Colors.redAccent,
      Colors.teal.shade400,
    ];
    final List iconBelanja = [
      FontAwesomeIcons.shirt,
      FontAwesomeIcons.shoePrints,
      FontAwesomeIcons.gamepad,
      FontAwesomeIcons.mobileScreen,
      FontAwesomeIcons.glasses,
      FontAwesomeIcons.baby,
      FontAwesomeIcons.gem,
      FontAwesomeIcons.appleWhole,
      FontAwesomeIcons.couch,
    ];
    final List namaProduct = [
      'Baju',
      'Sepatu',
      'Game',
      'SmartPhone',
      'Kaca Mata',
      'Perlengkapan Bayi',
      'Perhiasan',
      'Fruits',
      'Perabot',
    ];
    return Scaffold(
      backgroundColor: Color(0xFFBADFDB),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tugas 4 Flutter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: 10),
          CustomTextField('Nama', textInputType: TextInputType.name),
          SizedBox(height: 10),
          CustomTextField('Email', textInputType: TextInputType.emailAddress),
          SizedBox(height: 10),
          CustomTextField('No. HP', textInputType: TextInputType.phone),
          SizedBox(height: 10),
          CustomTextField(
            'Deskripsi',
            textInputType: TextInputType.streetAddress,
            minLines: 5,
          ),
          SizedBox(height: 15),
          ...List.generate(namaProduct.length, (index) {
            return Card(
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(iconBelanja[index], color: iconColor[index]),
                ),
                title: Text(namaProduct[index]),
                subtitle: Text(
                  getRandomPrice(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
