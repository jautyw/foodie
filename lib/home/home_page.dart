import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
      ],
    ),
      body: Center(
        child: Text("Logged in: ${user.email!}",
            style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}