import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:repair_services_computer/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: keyForm,
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
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
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
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
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      signUp();
                    }
                  },
                  child: Text(
                    "SignUp",
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
                                    builder: (_) => LoginScreen())),
                          text: " Login",
                          style: TextStyle(color: Colors.amber))
                    ],
                        text: "Sudah punya akun?",
                        style: const TextStyle(color: Colors.black)))
              ],
            ),
          ))),
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } catch (e) {
      print(e.toString());
    }
  }
}
