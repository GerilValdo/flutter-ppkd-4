import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ppkd_batch4/tugas/tugas_15/constant/endpoint.dart';
import 'package:ppkd_batch4/tugas/tugas_15/models/user_model15.dart';

class AuthAPI {
  static Future<UserModel15> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return UserModel15.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<UserModel15> getUser(String token) async {
    final url = Uri.parse(Endpoint.getUser);

    final response = await http.get(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    print("GET USER: ${response.body}");

    if (response.statusCode == 200) {
      return UserModel15.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Gagal mengambil user");
    }
  }

  static Future<User> updateUser({
  required String token,
  required String name,
}) async {
  final url = Uri.parse(Endpoint.updateUser);

  final response = await http.put(
    url,
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    },
    body: {"name": name},
  );

  print(response.body);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return User.fromJson(data["data"]);
  } else {
    final error = jsonDecode(response.body);
    throw Exception(error["message"] ?? "Gagal update profile");
  }
}

  static Future<UserModel15> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login); // pastikan sudah ada endpoint login

    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );

    print(response.body);

    if (response.statusCode == 200) {
      return UserModel15.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Login gagal");
    }
  }
}
