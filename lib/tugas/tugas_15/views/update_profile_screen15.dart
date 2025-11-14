import 'package:flutter/material.dart';
import 'package:ppkd_batch4/preferences/preference_handler.dart';
import 'package:ppkd_batch4/tugas/tugas_15/service/auth_api.dart';
import 'package:ppkd_batch4/tugas/tugas_15/models/user_model15.dart';

class UpdateProfileScreen15 extends StatefulWidget {
  final User user;

  const UpdateProfileScreen15({super.key, required this.user});

  @override
  State<UpdateProfileScreen15> createState() => _UpdateProfileScreen15State();
}

class _UpdateProfileScreen15State extends State<UpdateProfileScreen15> {
  final nameC = TextEditingController();
  final emailC = TextEditingController();

  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    nameC.text = widget.user.name ?? "";
    emailC.text = widget.user.email ?? "";
  }

  Future<void> updateProfile() async {
  setState(() => isSaving = true);

  try {
    final token = await PreferenceHandler.getToken();

    final updatedUser = await AuthAPI.updateUser(
      token: token!,
      name: nameC.text,
    );

    print("Update berhasil: ${updatedUser.name}");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated!")),
    );

    Navigator.pop(context, updatedUser); // kirim user terbaru
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }

  setState(() => isSaving = false);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Username")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameC,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: emailC,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Email (tidak dapat diedit)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isSaving ? null : updateProfile,
                child: Text(isSaving ? "Saving..." : "UPDATE USERNAME"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
