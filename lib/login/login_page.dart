import 'package:flutter/material.dart';
import 'package:foodie/components/my_text_field.dart';
import 'package:foodie/components/my_button.dart';
import 'package:foodie/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie/services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/firebase_options.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn(clientId: DefaultFirebaseOptions.currentPlatform.iosClientId).signIn();
    // final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken
    );

    // finally sign in
    // try {
    //   await FirebaseAuth.instance.signInWithCredential(
    //       credential
    //   );
    //   Navigator.pop(context);
    // } on FirebaseAuthException catch (e){
    //   print('e.code is');
    //   print(e.code);
    // }
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signUserIn() async {
    print(emailController.text);
    print(passwordController.text);
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       Future.delayed(Duration(seconds: 1), () {});
    //       return const Center(
    //         child: CircularProgressIndicator(
    //         ),
    //       );
    //     });
    // Navigator.pop(context);
    try {
      if (emailController.text != '' && passwordController.text != '') {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);

        print("user logged in successfully");
      } else {
        if (emailController.text == '') {
          showErrorMessage('Please enter an email');
          return;
        }
        if (passwordController.text == '') {
          showErrorMessage('Please enter a password');
          return;
        }
      }
    } on FirebaseAuthException catch (e) {
      print('e.code is');
      print(e.code);
      // Navigator.pop(context);
      if (e.code == 'user-not-found') {
        // Navigator.pop(context);
        showErrorMessage('No user found with given credentials');
      } else if (e.code == 'wrong-password') {
        // Navigator.pop(context);
        showErrorMessage('Wrong password entered');
      } else if (e.code == 'invalid-email') {
        // Navigator.pop(context);
        showErrorMessage('Email is invalid');
        // Navigator.pop(context);
        // return;
        // Navigator.pop(context);
        // showErrorMessage(e.code);
      }
      // Navigator.pop(context);
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // void wrongEmailMessage() {
  //   showDialog(context: context, builder: (context) {
  //     return const AlertDialog(
  //       title: Text('Incorrect Email entered'),
  //     );
  //   },
  //   );
  // }
  //
  // void wrongPasswordMessage() {
  //   showDialog(context: context, builder: (context) {
  //     return const AlertDialog(
  //       title: Text('Incorrect Password entered'),
  //     );
  //   },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              // logo
              Icon(
                Icons.food_bank_rounded,
                size: 100,
              ),
              SizedBox(height: 25),

              Text(
                'Welcome back, you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 25),

              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscuredText: false,
              ),

              SizedBox(height: 10),

              MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscuredText: true),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35),

              MyButton(
                onTap: signUserIn,
                text: 'Sign In',
              ),

              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or continue with',
                          style: TextStyle(color: Colors.grey[700])),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ))
                  ],
                ),
              ),

              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    imagePath: 'lib/images/google.png',
                    onTap: () => AuthService().signInWithGoogle(),
                  ),
                  SizedBox(width: 25),
                  SquareTile(
                      imagePath: 'lib/images/apple_logo.png',
                      onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?  ',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 6),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
