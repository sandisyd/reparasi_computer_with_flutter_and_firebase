import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  ProfilScreen({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              const CircleAvatar(
                minRadius: 30,
                backgroundColor: Colors.grey,
                backgroundImage:
                    NetworkImage("https://picsum.photos/seed/picsum/200/300"),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(user!.uid),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                leading: const ImageIcon(
                  AssetImage("img/logout.png"),
                  color: Colors.red,
                ),
                title: GestureDetector(
                  onTap: () => FirebaseAuth.instance.signOut(),
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
