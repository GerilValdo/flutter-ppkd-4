import 'package:flutter/material.dart';
import 'package:ppkd_batch4/preferences/preference_handler.dart';
import 'package:ppkd_batch4/tugas/tugas_15/models/user_model15.dart';
import 'package:ppkd_batch4/tugas/tugas_15/views/login_screen15.dart';
import 'package:ppkd_batch4/tugas/tugas_15/views/update_profile_screen15.dart';

class ProfileScreen15 extends StatefulWidget {
  final UserModel15 user;

  const ProfileScreen15({super.key, required this.user});

  @override
  State<ProfileScreen15> createState() => _ProfileScreen15State();
}

class _ProfileScreen15State extends State<ProfileScreen15> {
  @override
  Widget build(BuildContext context) {
    final userData = widget.user.data?.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            onPressed: () async {
              final updatedUser = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UpdateProfileScreen15(user: userData!),
                ),
              );

              if (updatedUser != null) {
                setState(() {
                  widget.user.data!.user = updatedUser;
                });
              }
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Username"),
              subtitle: Text(userData?.name ?? "No name"),
            ),

            ListTile(
              leading: const Icon(Icons.email),
              title: const Text("Email"),
              subtitle: Text(userData?.email ?? "No email"),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () async {
                  await PreferenceHandler.removeLogin(); // jika kamu punya
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen15()),
                    (route) => false,
                  );
                },

                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
