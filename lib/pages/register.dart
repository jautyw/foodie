import 'package:flutter/material.dart';
import 'package:foodie/components/my_text_field.dart';
import 'package:foodie/components/my_button.dart';
import 'package:foodie/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    print(emailController.text);
    print(passwordController.text);
    print(confirmPasswordController.text);

    try {
      if (passwordController.text != '' &&
          confirmPasswordController.text != '' &&
          emailController.text != '') {
        if (passwordController.text == confirmPasswordController.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
          print('account created');
        } else {
          // Navigator.pop(context);
          showErrorMessage('Passwords entered do not match');
        }
      } else {
        if (emailController.text == '') {
          showErrorMessage('Please enter an email');
          return;
        }
        if (passwordController.text == '') {
          showErrorMessage('Please enter a password');
          return;
        }
        if (confirmPasswordController.text == '') {
          showErrorMessage('Please confirm your password');
          return;
        }
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
      return;
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
            SizedBox(height: 20),
            // logo
            Icon(
              Icons.food_bank_rounded,
              size: 100,
            ),
            SizedBox(height: 20),

            Text(
              'Fill in the information below to complete sign up',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),

            SizedBox(height: 50),

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

            MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscuredText: true),

            SizedBox(height: 40),

            MyButton(
              onTap: signUserUp,
              text: 'Sign Up',
            ),

            // TODO: add ability to sign user up here with google or apple
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SquareTile(imagePath: 'lib/images/google.png'),
            //     SizedBox(width: 25),
            //     SquareTile(imagePath: 'lib/images/apple.png'),
            //   ],
            // ),

            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?  ',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(height: 6),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ))),
      ),
    );
  }
}
