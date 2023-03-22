import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../models/item_model.dart';
import '../models/utils.dart';
import 'displayFoodFromReceipt.dart';

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  DisplayPictureScreen({super.key, required this.imagePath});

  List<Item> items = Utils.getMockedAddItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: const Text('Confirm this photo'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[400],
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.file(
                  File(imagePath))
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[400],
        // Provide an onPressed callback.
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DisplayFoodFromReceipt(
                // Pass the food items retrieved from the api and allow
                // the user to input expiry dates.
                items: items,
                // items: items,
              ),
            ),
          );;
        },
        child: Icon(Icons.check),
      ),
    );
  }
}