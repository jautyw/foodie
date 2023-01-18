import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 200),
            Lottie .network(
              'https://assets10.lottiefiles.com/temp/lf20_nXwOJj.json',
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
                'Need recipe inspiration? \n\n'
                'We create delicious recipes from your leftover food',
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
