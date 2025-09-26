import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app/common_widget/background.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                              SizedBox(height: 50.h),
                              TextFormField(
                                controller: firstNameController,
                                decoration: InputDecoration(
                                  labelText: "First name *",
                                ),
                              ),
                              SizedBox(height: 16.h),
                              TextFormField(
                                controller: lasttNameController,
                                decoration: InputDecoration(
                                  labelText: "Last name *",
                                ),
                              ),
                              SizedBox(height: 16.h),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Email *",
                                ),
                              ),
                              SizedBox(height: 16.h),
                              TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: "Password *",
                                ),
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
    );
  }
}

// import 'package:flutter/material.dart';

// import '../../../helper/db_helper.dart';
// import '../../login_screen.dart';

// class SignupScreen extends StatelessWidget {
//   final TextEditingController emailCtrl = TextEditingController();
//   final TextEditingController passCtrl = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           constraints: BoxConstraints(maxWidth: 400),
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Signup", style: TextStyle(fontSize: 28)),
//               TextField(
//                 controller: emailCtrl,
//                 decoration: InputDecoration(labelText: "Email"),
//               ),
//               TextField(
//                 controller: passCtrl,
//                 decoration: InputDecoration(labelText: "Password"),
//                 obscureText: true,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   await DBHelper.signup(emailCtrl.text, passCtrl.text);
//                   ScaffoldMessenger.of(
//                     context,
//                   ).showSnackBar(SnackBar(content: Text("Signup Success")));
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (_) => LoginScreen()),
//                   );
//                 },
//                 child: Text("Signup"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
