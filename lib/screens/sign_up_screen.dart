import 'package:flutter/material.dart';

import '../db_helper.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Signup", style: TextStyle(fontSize: 28)),
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: passCtrl,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await DBHelper.signup(emailCtrl.text, passCtrl.text);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Signup Success")));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
                child: Text("Signup"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
