import 'package:flutter/material.dart';
import 'package:ppkd_batch4/database/db_helper.dart';
import 'package:ppkd_batch4/models/user_model.dart';
import 'package:ppkd_batch4/preferences/preference_handler.dart';
import 'package:ppkd_batch4/tugas/tugas_11/login_screen.dart';
import 'package:ppkd_batch4/tugas/tugas_11/tugas_slicing_mpro.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomeScreen')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: DbHelper.getAllUser(),
              // initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData ||
                    (snapshot.data as List).isEmpty) {
                  return Center(child: Text('No Data'));
                } else {
                  final data = snapshot.data as List<UserModel>;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final items = data[index];
                      return ListTile(
                        title: Text(items.username!),
                        subtitle: Text(items.email!),
                      );
                    },
                  );
                }
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {
              PreferenceHandler.removeLogin();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => TugasSlicingMpro()),
                (route) => false,
              );
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
