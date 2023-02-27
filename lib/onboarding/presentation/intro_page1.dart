import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  _IntroPage1State createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool bowl = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          SizedBox(height: 200),
          GestureDetector(
            onTap: () {
              // if (bowl == false) {
              //   bowl = true;
              //   _controller.();
              // } else {
              //   bowl = false;
              //   _controller.reverse();
              // }
            },
            child: SingleChildScrollView(
              child: Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_TmewUx.json',
                // controller: _controller,
                repeat: false,
                alignment: Alignment.center,
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Food Saver',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              'Welcome to Food Saver \n\n'
              'We help you keep on top of your perishable goods',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.black,
              ),
              ),
            ),
        ]),
      ),
    );
  }
}

// Column(
// children: [
// Lottie.network(
// 'https://assets10.lottiefiles.com/packages/lf20_TmewUx.json',
// controller: _controller,
// repeat: false,
// ),
// Text(
// 'Welcome to Food Saver, we help you keep on top of your perishable goods!',
// style: TextStyle(
// color: Colors.red[300],
// fontSize: 18,
// ),
// ),
// ],
// )
// app animations:
// https://assets10.lottiefiles.com/packages/lf20_TmewUx.json
// https://assets6.lottiefiles.com/packages/lf20_8o8qzD.json
// https://assets10.lottiefiles.com/temp/lf20_nXwOJj.json
//
//
//
