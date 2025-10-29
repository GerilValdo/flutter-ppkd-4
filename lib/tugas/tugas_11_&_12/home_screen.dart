import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ppkd_batch4/database/db_helper.dart';
import 'package:ppkd_batch4/models/user_model.dart';
import 'package:ppkd_batch4/preferences/preference_handler.dart';
import 'package:ppkd_batch4/tugas/tugas_11_&_12/tugas_slicing_mpro.dart';
import 'package:ppkd_batch4/widgets/custom_text_field_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameC = TextEditingController();
  final ageC = TextEditingController();
  final emailC = TextEditingController();
  final classC = TextEditingController();
  getData() {
    setState(() {
      DbHelper.getAllUser();
    });
  }

  Future<void> _onEdit(UserModel user) async {
    final editUsernameC = TextEditingController(text: user.username);
    final editNumberC = TextEditingController(text: user.number.toString());
    final editCountryC = TextEditingController(text: user.country);
    final editEmailC = TextEditingController(text: user.email);
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              CustomTextFieldAuth(label: 'Username', controller: editUsernameC),
              CustomTextFieldAuth(label: 'Email', controller: editEmailC),
              CustomTextFieldAuth(
                label: 'Number Phone',
                controller: editNumberC,
              ),
              CustomTextFieldAuth(label: 'Country', controller: editCountryC),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      final updated = UserModel(
        id: user.id,
        username: editUsernameC.text,
        email: editEmailC.text,
        country: editCountryC.text,
        number: int.parse(editNumberC.text),
      );
      DbHelper.updateUser(updated);
      getData();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Data berhasil di update')));
    }
  }

  Future<void> _onDelete(UserModel user) async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                "Apakah anda yakin ingin menghapus data ${user.username}?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Jangan"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Ya, hapus aja"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      DbHelper.deleteUser(user.id!);
      getData();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Data berhasil di hapus')));
    }
  }

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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 5,
                          children: [
                            IconButton(
                              onPressed: () {
                                _onEdit(items);
                              },
                              icon: Icon(
                                FontAwesomeIcons.penToSquare,
                                color: Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _onDelete(items);
                              },
                              icon: Icon(
                                FontAwesomeIcons.trashCan,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
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
