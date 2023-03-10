import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/home/home.dart';
import 'package:foodie/home/home_page.dart';
import 'package:foodie/services/local_auth.dart';

import '../onboarding/presentation/onboarding_screens.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            print('checking snapshot:');
            print(snapshot);
            // user is logged in
            if (snapshot.hasData) {
              print('snapshot has data and should show home screen');
              // if (LocalAuth.authenticate() == true) {
              //   return OnboardingScreens();
              // };
              // TODO investigate why this does not load: return Home();
              // Navigator.pop(context);
              return ItemListPage();
            } else {
              print('snapshot does not have data and will show onboarding screens');
              print(snapshot);
              // user is NOT logged in
              return OnboardingScreens();
              // return LoginOrRegisterPage();
            }
          }
      )
    );
  }
}

// class AuthPage extends StatelessWidget {
//   const AuthPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         User? user = snapshot.data;
//         /// is because there is user already logged
//         return HomePage();
//       }
//
//       /// other way there is no user logged.
//       return OnboardingScreens();
//     });
//   }
// }