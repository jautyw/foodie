import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Savings extends StatelessWidget {
  const Savings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Where do you do your weekly shop?',
                        style: TextStyle(
                          fontSize: 30,
                        )),
                    CarouselSlider(
                      options: CarouselOptions(height: 400.0),
                      items: ['aldi', 'asda', 'lidl', 'marks', 'morrisons', 'ocado', 'sainsburys', 'tesco', 'waitrose'].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'lib/images/supermarkets/' + '$i' + '.jpeg',
                                    fit: BoxFit.fitWidth,
                                  )
                              ),
                                // width: MediaQuery
                                //     .of(context)
                                //     .size
                                //     .width,
                                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                // decoration: BoxDecoration(
                                //     color: Colors.amber
                                // ),
                                // child: Text(
                                //   'text $i', style: TextStyle(fontSize: 16.0),)
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                )
            )));
  }
}

// class SupermarketImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       child: Image(image:,),
//     )
//   }
// }