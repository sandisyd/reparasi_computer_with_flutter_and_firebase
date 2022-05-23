import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:repair_services_computer/home/home_screen.dart';
import 'package:repair_services_computer/home/menu_main.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool verifyEmail = false;
  Timer? timer;
  bool canResendEmail = false;
  @override
  Widget build(BuildContext context) {
    return verifyEmail
        ? MainMenu()
        : Scaffold(
            body: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child:
                        Text("Verifikasi email sudah terkirim ke email kamu"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    color: Colors.green,
                    onPressed: canResendEmail ? sendVerifyEmail : null,
                    child: const Text(
                      "Kirim ulang",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.green,
                    onPressed: () => FirebaseAuth.instance.signOut(),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  @override
  void initState() {
    super.initState();
    verifyEmail = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!verifyEmail) {
      sendVerifyEmail();
      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      verifyEmail = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (verifyEmail) timer?.cancel();
  }

  Future sendVerifyEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 3));
      setState(() => canResendEmail = true);
    } catch (e) {
      print(e.toString());
    }
  }
}
