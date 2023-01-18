import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 200),
            Lottie.network(
              'https://assets6.lottiefiles.com/packages/lf20_8o8qzD.json',
              repeat: false,
              alignment: Alignment.center,
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text(
                'Save money leaving more for you to spend on the things that matter!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
