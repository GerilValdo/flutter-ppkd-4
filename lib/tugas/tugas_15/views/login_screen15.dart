import 'package:flutter/material.dart';
import 'package:ppkd_batch4/preferences/preference_handler.dart';
import 'package:ppkd_batch4/tugas/tugas_15/service/auth_api.dart';
// import 'package:ppkd_batch4/tugas/tugas_15/views/home_screen15.dart';
import 'package:ppkd_batch4/tugas/tugas_15/views/profile_screen15.dart';

class LoginScreen15 extends StatefulWidget {
  const LoginScreen15({super.key});

  @override
  State<LoginScreen15> createState() => _LoginScreen15State();
}

class _LoginScreen15State extends State<LoginScreen15> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  bool isVisibility = false;
  bool isLoading = false;

  Future<void> login() async {
  if (_formKey.currentState!.validate()) {
    setState(() => isLoading = true);

    try {
      final result = await AuthAPI.loginUser(
        email: emailC.text,
        password: passwordC.text,
      );

      if (result.data?.token == null) {
        throw Exception("Token tidak ditemukan");
      }

      await PreferenceHandler.saveToken(result.data!.token!);
      await PreferenceHandler.saveLogin(true);

      // 👇 kirim user model ke profile screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ProfileScreen15(user: result),
        ),
      );

    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login gagal: $e")));
    } finally {
      setState(() => isLoading = false);
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [buildBackground(), buildFormLayer()]),
    );
  }

  // ================================
  // Background sama seperti register
  // ================================
  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/pikachu.webp"),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
    );
  }

  // ================================
  // FORM LOGIN
  // ================================
  SafeArea buildFormLayer() {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            color: Colors.white.withOpacity(0.85),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    height(12),

                    const Text("Login to continue"),
                    height(20),

                    buildTitle("Email Address"),
                    height(10),
                    buildTextField(
                      hintText: "Enter your email",
                      controller: emailC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email tidak boleh kosong";
                        }
                        if (!value.contains("@")) {
                          return "Email tidak valid";
                        }
                        return null;
                      },
                    ),

                    height(16),
                    buildTitle("Password"),
                    height(10),
                    buildTextField(
                      isPassword: true,
                      hintText: "Enter your password",
                      controller: passwordC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password tidak boleh kosong";
                        } else if (value.length < 6) {
                          return "Password minimal 6 karakter";
                        }
                        return null;
                      },
                    ),

                    height(24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : login,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "LOGIN",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),

                    height(16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================================
  // Custom Widgets
  // ================================
  Widget buildTitle(String text) {
    return Row(children: [Text(text, style: const TextStyle(fontSize: 12))]);
  }

  TextFormField buildTextField({
    required String hintText,
    required TextEditingController controller,
    String? Function(String?)? validator,
    bool isPassword = false,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? !isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: Colors.black),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isVisibility ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
              )
            : null,
      ),
    );
  }

  SizedBox height(double h) => SizedBox(height: h);
}
