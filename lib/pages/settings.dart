import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:foodie/components/constants/colours.dart';
import 'package:share_plus/share_plus.dart';
import '../components/my_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          backgroundColor: tdBlack,
          title: const Text('Settings'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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

            GestureDetector(
              onTap: () => shareApp(context),
              child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: tdBlack, borderRadius: BorderRadius.circular(8)
                  ),
                  child: const Center(
                      child: Text('Share Foodie to Family and Friends',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)
                      )
                  )
              ),
            ),
          ]),
        ))));
  }

  void shareApp(BuildContext context) {
    // final RenderBox box = context.findRenderObject();
    String text =
        'Hey, I am using Foodie to stop food waste and save money, downaload the app here -> https://google.com';
    Share.share(
      text,
    );
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
}

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
