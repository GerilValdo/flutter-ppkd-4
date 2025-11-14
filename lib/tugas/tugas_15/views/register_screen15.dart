import 'package:flutter/material.dart';
import 'package:ppkd_batch4/tugas/tugas_15/extension/navigation.dart';
import 'package:ppkd_batch4/preferences/preference_handler.dart';
import 'package:ppkd_batch4/tugas/tugas_11_&_12/home_screen.dart';
import 'package:ppkd_batch4/tugas/tugas_15/models/user_model15.dart';
import 'package:ppkd_batch4/tugas/tugas_15/service/auth_api.dart';
import 'package:ppkd_batch4/tugas/tugas_15/views/login_screen15.dart';
import 'package:ppkd_batch4/tugas/tugas_15/widgets/login_button.dart';

class RegisterScreen15 extends StatefulWidget {
  const RegisterScreen15({super.key});
  static const id = "/register_day33";
  @override
  State<RegisterScreen15> createState() => _RegisterScreen15State();
}

class _RegisterScreen15State extends State<RegisterScreen15> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isVisibility = false;
  bool isLoading = false;
  UserModel15 user = UserModel15();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  login() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  final _formKey = GlobalKey<FormState>();
  SafeArea buildLayer() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hello, Welcome",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                height(12),
                Text(
                  "Register to access your account",
                  // style: TextStyle(fontSize: 14, color: AppColor.gray88),
                ),
                height(24),
                buildTitle("Name"),
                height(12),
                buildTextField(
                  hintText: "Enter your name",
                  // isPassword: true,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                height(16),
                buildTitle("Email Address"),
                height(12),
                buildTextField(
                  hintText: "Enter your email",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email tidak boleh kosong";
                    } else if (!value.contains('@')) {
                      return "Email tidak valid";
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                    ).hasMatch(value)) {
                      return "Format Email tidak valid";
                    }
                    return null;
                  },
                ),

                height(16),
                buildTitle("Password"),
                height(12),
                buildTextField(
                  hintText: "Enter your password",
                  isPassword: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    } else if (value.length < 6) {
                      return "Password minimal 6 karakter";
                    }
                    return null;
                  },
                ),
                height(16),

                height(24),
                LoginButton(
                  text: "Register",
                  isLoading: isLoading,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print(emailController.text);
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        final result = await AuthAPI.registerUser(
                          email: emailController.text,
                          name: nameController.text,
                          password: passwordController.text,
                        );
                        setState(() {
                          isLoading = false;
                          user = result;
                          PreferenceHandler.saveToken(user.data!.token!);
                        });
                        print(result);
                        context.pushReplacement(LoginScreen15());
                      } catch (e) {
                        print(e.toString());
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                        setState(() {
                          isLoading = false;
                        });
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         BottomNavCustomDay15(email: emailController.text),
                      //   ),
                      // );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Validation Error"),
                            content: Text("Please fill all fields"),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: Text("Ga OK"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),

                // height(20),
                // LoginButton(
                //   text: "Ke Day13",
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => DryWidgetDay13()),
                //     );
                //   },
                // ),
                height(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      // style: TextStyle(fontSize: 12, color: AppColor.gray88),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushReplacement(LoginScreen15());
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => MeetEmpatA()),
                        // );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          // color: AppColor.blueButton,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.2,
          image: AssetImage("assets/images/pikachu.webp"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility_off : Icons.visibility,
                  // color: AppColor.gray88,
                ),
              )
            : null,
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        // Text(text, style: TextStyle(fontSize: 12, color: AppColor.gray88)),
      ],
    );
  }
}
