import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          backgroundColor: Colors.green,
          title: const Text('Profile'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: ListView(children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text('Change Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)))),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text('Choose your diet 👉',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)))),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text('View your achievements 🥇',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)))),
            ),
          ]),
        ));
  }
}