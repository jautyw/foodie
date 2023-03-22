import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_extensions/string_extensions.dart';
import '../models/item_model.dart';
import 'package:http/http.dart' as http;

import '../models/utils.dart';

class DisplayFoodFromReceipt extends StatefulWidget {
  final List<Item> items;

  const DisplayFoodFromReceipt({super.key, required this.items});

  @override
  State<DisplayFoodFromReceipt> createState() => _DisplayFoodFromReceipt();
}

// A widget that displays the food results from the picture taken by the user.
class _DisplayFoodFromReceipt extends State<DisplayFoodFromReceipt> {
  List<Item> items = Utils.getMockedAddItems();
  int? _slide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detected food from receipt'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,8,8,0),
              child: const Text('Days until expiry',
                  textAlign: TextAlign.end,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    height: 90,
                    child: Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),
                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),
                        // All actions are defined in the children parameter.
                        children: const [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      endActionPane: const ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFF0392CF),
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'lib/images/' + items[index].name + '.png',
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            width: 0,
                          ),
                          Text(
                            items[index].name.capitalize!,
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                              items[index].daysUntilExpiry.toString() + ' days',
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[400],
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.check),
    ));
  }
}

Future<FoodItems> convertImageToFoodItems(XFile image) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8080/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, XFile>{
      'image': image,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return FoodItems.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class FoodItems {
  List<String> foods = [];

  FoodItems({
    required this.foods,
  });

  factory FoodItems.fromJson(Map<String, dynamic> json) {
    return FoodItems(
      foods: json['foods'],
    );
  }
}

void doNothing(BuildContext context) {}
