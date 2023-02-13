import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/pages/onboarding_screens.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
          title: const Text('Settings'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: ListView(children: [
            // Text('Change your app icon here'),
            // SizedBox(height: 20),
            // Use Builder to get the widget context
            // Builder(
            //   builder: (BuildContext context) {
            //     return BackButton(
            //       onPressed: () => shareApp(context),
            //       child: const Text(
            //           'Share Foodie to Family and Friends'),
            //       style: (
            //
            //       ),
            //
            //     );
            //   },
            // ),

            // GestureDetector(
            //   onTap: () => (context),
            //   child: Container(
            //       padding: const EdgeInsets.all(25),
            //       margin: const EdgeInsets.symmetric(horizontal: 25),
            //       decoration: BoxDecoration(
            //           color: Colors.black,
            //           borderRadius: BorderRadius.circular(8)),
            //       child: const Center(
            //           child: Text('Share Foodie to Family and Friends',
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 16)))),
            // ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => shareApp(context),
              child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text('Share Foodie to Family and Friends 🔗',
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
                      child: Text('Change App Icon 📱',
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
                      child: Text('Follow us on social media 🐦',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)))),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Log Out'),
                    content: Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        child: Text("Yes"),
                        onPressed: () {
                          // signUserOut;
                          // Navigator.push(context, MaterialPageRoute (
                          //   builder: (BuildContext context) => OnboardingScreens(),
                          // ),
                          // );
                        },
                      ),
                      TextButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
              // onTap: signUserOut,
              // onTap: () {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              // },
              child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text('Log out 👋',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)))),
            ),
          ]),
        ));
  }

  void shareApp(BuildContext context) {
    // final RenderBox box = context.findRenderObject();
    String text =
        'Hey, I am using Foodie to stop food waste and save money, downaload the app here -> https://google.com';
    Share.share(
      text,
    );
  }
}

// changeAppIcon() async {
//   try {
//     if (await FlutterDynamicIcon.supportsAlternateIcons) {
//       await FlutterDynamicIcon.setAlternateIconName(iconName[iconIndex]);
//       debugPrint('app icon change success');
//       return;
//     }
//   } catch (e) {
//     debugPrint('Exception: ${e.toString()}');
//   }
// }

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Route'),
//       ),
//
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
