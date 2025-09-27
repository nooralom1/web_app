// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app/common_widget/background.dart';
import 'package:web_app/common_widget/custom_button.dart';
import 'package:web_app/helper/db_helper.dart';
import 'package:web_app/view/log_in/presentation/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lasttNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    firstNameController.dispose();
    lasttNameController.dispose();
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
                            child: SingleChildScrollView(
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
                                  SizedBox(height: 80.h),
                                  TextFormField(
                                    controller: firstNameController,
                                    decoration: InputDecoration(
                                      labelText: "First name *",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "First name field is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 16.h),
                                  TextFormField(
                                    controller: lasttNameController,
                                    decoration: InputDecoration(
                                      labelText: "Last name *",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Last name field is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 16.h),
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
                                        final name =
                                            "${firstNameController.text}${lasttNameController.text}";
                                        if (_formKey.currentState!.validate()) {
                                          await DBHelper.signup(
                                            emailController.text,
                                            passwordController.text,
                                            name,
                                          );

                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text("Signup Success"),
                                            ),
                                          );

                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => LoginScreen(),
                                            ),
                                          );
                                        }
                                      },
                                      text: "Signup",
                                    ),
                                  ),
                                  SizedBox(height: 50.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Already have a account?  ",
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => LoginScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Sign in",
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
