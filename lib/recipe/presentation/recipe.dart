import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('Recipes'),
                  ]),
                ))));
  }
}