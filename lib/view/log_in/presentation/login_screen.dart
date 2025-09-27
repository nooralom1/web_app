// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app/common_widget/background.dart';
import 'package:web_app/common_widget/custom_button.dart';
import 'package:web_app/helper/database_helper.dart';
import 'package:web_app/view/home/presentation/home_screen.dart';
import 'package:web_app/view/sign_up/presentation/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Background(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 600.h,
                          decoration: BoxDecoration(
                            color: Colors.blue.withValues(alpha: 0.2),
                          ),
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.1),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/image/logo.png",
                                      height: 150.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      "assets/image/airplane.png",
                                      height: 250.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 600.h,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 24.h),
                                Center(
                                  child: Text(
                                    "Create your KLM account",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 120.h),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: "Email *",
                                  ),
                                  validator: (value) {
                                    final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                    ).hasMatch(value ?? "");
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your email";
                                    } else if (!emailValid) {
                                      return "Please enter a valid email";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: 16.h),
                                TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    labelText: "Password *",
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 8) {
                                      return "Enter Minimum 8 Digit";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: 50.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25.w,
                                  ),
                                  child: CustomButton(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        var user = await DatabaseHelper.login(
                                          emailController.text,
                                          passwordController.text,
                                        );
                                        if (user != null) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => HomeScreen(
                                                name: user['name'],
                                              ),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "Invalid credentials",
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    text: "Login",
                                  ),
                                ),
                                SizedBox(height: 50.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "You don't have an account?  ",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => SignUpScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
