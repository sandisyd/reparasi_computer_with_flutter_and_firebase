import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:repair_services_computer/home/signUp/signUp_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: SafeArea(
              child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                  label: const Text("Email"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: signIn,
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            RichText(
                text: TextSpan(
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignUpScreen())),
                      text: " SignUp",
                      style: TextStyle(color: Colors.amber))
                ],
                    text: "Belum punya akun?",
                    style: const TextStyle(color: Colors.black)))
          ],
        ),
      ))),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } catch (e) {
      print(e.toString());
    }
  }
}
