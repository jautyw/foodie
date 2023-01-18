import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//
//   final user = FirebaseAuth.instance.currentUser!;
//
//   // sign user out method
//   void signUserOut() {
//     FirebaseAuth.instance.signOut();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(
//       actions: [
//         IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
//       ],
//     ),
//       body: Center(
//         child: Text("Logged in:" + user.email!,
//             style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

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
        child: Text("Logged in:" + user.email!,
            style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

// ChatGPT attempt
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//             },
//             icon: Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text("Logged in: ", style: TextStyle(fontSize: 20)),
//       ),
//     );
//   }
// }