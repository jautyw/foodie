import 'package:flutter/material.dart';
import 'package:foodie/pages/login_or_register.dart';
import 'package:foodie/pages/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../pages/intro_page/intro_page1.dart';
import '../pages/intro_page/intro_page2.dart';
import '../pages/intro_page/intro_page3.dart';

class OnboardingScreens extends StatefulWidget {
  OnboardingScreens({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreens> {
  PageController _controller = PageController();

  // keep track if we are on the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // skip
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Text('Skip'),
              ),
              // dot indicator
              SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.green.shade300,
                    activeDotColor:  Colors.green.shade300,
                  ),
                  onDotClicked: (index) {
                    setState(() {
                      _controller.jumpToPage(index);
                    });
                  },

              ),
              //next or done
              onLastPage ?
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return LoginOrRegisterPage();
                  }));
                },
                child: Text('Done'),
              ) : GestureDetector(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn
                  );
                },
                child: Text('Next'),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
