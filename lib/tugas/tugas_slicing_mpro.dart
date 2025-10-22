import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_batch4/config/route.dart';
import 'package:ppkd_batch4/config/style_text.dart';
import 'package:ppkd_batch4/widgets/custom_button.dart';
import 'package:ppkd_batch4/widgets/custom_text_field_auth.dart';

class TugasSlicingMpro extends StatelessWidget {
  const TugasSlicingMpro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 73,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage('assets/images/reddit.webp'),
                    ),
                  ),
                ),
              ),
              Text('Log In', style: StyleText.textHeadline),
              SizedBox(height: 18),
              Text.rich(
                TextSpan(
                  text: 'By continuing, you agree to our ',
                  style: StyleText.textBodySmall.copyWith(
                    color: Color(0xFF040404).withValues(alpha: 0.9),
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'User Agreement ',
                      style: StyleText.textBodySmall.copyWith(
                        color: Color(0xFF535AFC).withValues(alpha: 0.9),
                      ),
                    ),
                    TextSpan(
                      text: 'and acknowledge that you understand the ',
                      style: StyleText.textBodySmall.copyWith(
                        color: Color(0xFF040404).withValues(alpha: 0.9),
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'Privacy Policy',
                      style: StyleText.textBodySmall.copyWith(
                        color: Color(0xFF535AFC).withValues(alpha: 0.9),
                      ),
                    ),
                    TextSpan(
                      text: '.',
                      style: StyleText.textBodySmall.copyWith(
                        color: Color(0xFF040404).withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              CustomButton(
                label: 'Continue with Google',
                pathImage: 'assets/images/google.webp',
              ),
              SizedBox(height: 26),
              CustomButton(
                label: 'Continue with Apple',
                pathImage: 'assets/images/apple_logo.webp',
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey, endIndent: 10)),
                  Text(
                    'OR',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Expanded(child: Divider(color: Colors.grey, indent: 10)),
                ],
              ),
              SizedBox(height: 47),
              CustomTextFieldAuth(label: 'Username'),
              SizedBox(height: 20),
              CustomTextFieldAuth(label: 'Password'),
              SizedBox(height: 26),
              Text.rich(
                TextSpan(
                  text: 'New to Reddit? ',
                  style: StyleText.textBodyMedium.copyWith(
                    color: Color(0xFF656565),
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'Sign Up',
                      style: StyleText.textBodyMedium.copyWith(
                        color: Color(0xFF535AFC),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: 'Forgot your ',
                  style: StyleText.textBodyMedium.copyWith(
                    color: Color(0xFF656565),
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'username ',
                      style: StyleText.textBodyMedium.copyWith(
                        color: Color(0xFF535AFC),
                      ),
                    ),
                    TextSpan(
                      text: 'or ',
                      style: StyleText.textBodyMedium.copyWith(
                        color: Color(0xFF656565),
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'password?',
                      style: StyleText.textBodyMedium.copyWith(
                        color: Color(0xFF535AFC),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(80),
                onTap: () {
                  Navigator.pushNamed(context, RouteScreen.home.path);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFD3D3D3).withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(80),
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Log In',
                        style: StyleText.textButton.copyWith(
                          color: Color(0xFF656565).withValues(alpha: 0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
