import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class AddFood extends StatefulWidget {
  AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  int _addSlide = 0;

  // bool _isSelected = false;
  late Future<FoodItems> defaultFoodItems;

  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int direction = 0;

  @override
  void initState() {
    startCamera(direction);
    super.initState();
    defaultFoodItems = fetchDefaultFoodItems();
  }

  List<Widget> addFoodMethods = [addManually(), addUsingReceipt()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Add your food',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CloseButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
                Lottie.network(
                  'https://assets7.lottiefiles.com/private_files/lf30_fcotb6bb.json',
                  // controller: _controller,
                  repeat: true,
                  alignment: Alignment.center,
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 10),
                CupertinoSlidingSegmentedControl(
                  children: {
                    0: Text('Add manually'),
                    1: Text('Add using receipt'),
                    // 2: buildSegment(String text) => Container();
                  },
                  groupValue: _addSlide,
                  onValueChanged: (newValue) {
                    setState(() {
                      _addSlide = newValue!;
                    });
                  },
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  child: addFoodMethods[_addSlide],
                  // child: addUsingReceipt(),
                ),
                // sin: AddFoodMethods[_addSlide],
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.green[400],
        focusColor: Colors.green[100],
        hoverElevation: 20,
        elevation: 20,
        // foregroundColor: Colors.green,
        backgroundColor: Colors.green,
        tooltip: 'Add an item',
        child: Icon(Icons.add),
        onPressed: () async {
          MakeAddFoodRequest();
        },
      ),
    );
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); //To refresh widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  static Widget addUsingReceipt() {
    return Container(
      child: Column(
        children: [SizedBox(height: 80), Text('Feature Coming Soon! 👀')],
      ),
    );
    // if (cameraController.value.isInitialized) {
    //   return Scaffold(
    //       body: ClipRect(
    //         child: Stack(
    //           children: [
    //             CameraPreview(cameraController),
    //             GestureDetector(
    //               onTap: () {
    //                 setState(() {
    //                   direction = direction == 0 ? 1 : 0;
    //                   startCamera(direction);
    //                 });
    //               },
    //               child:
    //               button(Icons.flip_camera_ios_outlined, Alignment.bottomLeft),
    //             ),
    //             GestureDetector(
    //               onTap: () {
    //                 cameraController.takePicture().then((XFile? file) {
    //                   if (mounted) {
    //                     if (file != null) {
    //                       print("Picture saved to ${file.path}");
    //                     }
    //                   }
    //                 });
    //               },
    //               child: button(Icons.camera_alt_outlined, Alignment.bottomCenter),
    //             ),
    //             Align(
    //               alignment: AlignmentDirectional.topCenter,
    //               child: Text(
    //                 "My Camera",
    //                 style: TextStyle(
    //                   fontSize: 30,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ));
    // } else {
    //   return const SizedBox();
    // }
  }

  Widget button(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  static Widget addManually() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.center,
              child: FutureBuilder(
                future: fetchDefaultFoodItems(),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    // return ListView.builder(
                    //   itemCount: snapshot.data.length,
                    //   itemBuilder: (ctx, index) => FoodChipWidget(foodName: snapshot.data[index])
                    // );
                    return Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Fridge',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Container(
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 3.0,
                          children: [
                            // ListView.builder(itemBuilder: itemBuilder)
                            // FoodChipWidget(
                            //   foodName: snapshot.data[index],
                            // ),
                            // FoodChipWidget(
                            //   foodName: 'Apple',
                            // ),
                            // FoodChipWidget(
                            //   foodName: 'Pear',
                            // ),
                            // FoodChipWidget(
                            //   foodName: 'Potato',
                            // ),
                            // FoodChipWidget(
                            //   foodName: 'Chicken',
                            // ),
                            // FoodChipWidget(
                            //   foodName: 'Courgette',
                            // ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Freezer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Wrap(
                              spacing: 5.0,
                              runSpacing: 3.0,
                              children: [
                                // ListView.builder(
                                //   itemCount: defaultFoodItems.length,
                                //   itemBuilder: (BuildContext ctx, int index) {
                                //   return FoodChipWidget(
                                //     foodName:
                                //   );
                                // }
                                FoodChipWidget(
                                  foodName: 'Chicken',
                                ),
                                FoodChipWidget(
                                  foodName: 'Ice Cream',
                                ),
                                FoodChipWidget(
                                  foodName: 'Vegetables',
                                ),
                                FoodChipWidget(
                                  foodName: 'Ice',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Cupboard',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Wrap(
                              spacing: 5.0,
                              runSpacing: 3.0,
                              children: [
                                FoodChipWidget(
                                  foodName: 'Onions',
                                ),
                                FoodChipWidget(
                                  foodName: 'Garlic',
                                ),
                                FoodChipWidget(
                                  foodName: 'Sweet Potato',
                                ),
                                FoodChipWidget(
                                  foodName: 'Potato',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]);
                    // Container(
                    //   child: Wrap(
                    //     spacing: 5.0,
                    //     runSpacing: 3.0,
                    //     children: [
                    //       FoodChipWidget(
                    //         foodName: 'Apple',
                    //       ),
                    //       FoodChipWidget(
                    //         foodName: 'Pear',
                    //       ),
                    //       FoodChipWidget(
                    //         foodName: 'Potato',
                    //       ),
                    //       FoodChipWidget(
                    //         foodName: 'Chicken',
                    //       ),
                    //       FoodChipWidget(
                    //         foodName: 'Courgette',
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //   Align(
                    //     alignment: Alignment.topLeft,
                    //     child: Text(
                    //       'Freezer',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         fontSize: 30,
                    //       ),
                    //     ),
                    //   ),
                    // Padding(
                    // padding: EdgeInsets.only(left: 8.0),
                    // child: Align(
                    // alignment: Alignment.centerLeft,
                    // child: Container(
                    // child: Wrap(
                    // spacing: 5.0,
                    // runSpacing: 3.0,
                    // children: [
                    // FoodChipWidget(
                    // foodName: 'Chicken',
                    // ),
                    // FoodChipWidget(
                    // foodName: 'Ice Cream',
                    // ),
                    // FoodChipWidget(
                    // foodName: 'Vegetables',
                    // ),
                    // FoodChipWidget(
                    // foodName: 'Ice',
                    // ),
                    // ],
                    // ),
                    // ),
                    // ),
                    // ),
                    // Align(
                    // alignment: Alignment.topLeft,
                    // child: Text(
                    // 'Cupboard',
                    // textAlign: TextAlign.center,
                    // style: TextStyle(
                    // fontSize: 30,
                    // ),
                    // ),
                    // ),
                    // Padding(
                    // padding: EdgeInsets.only(left: 8.0),
                    // child: Align(
                    // alignment: Alignment.centerLeft,
                    // child: Container(
                    // child: Wrap(
                    // spacing: 5.0,
                    // runSpacing: 3.0,
                    // children: [
                    // FoodChipWidget(
                    // foodName: 'Onions',
                    // ),
                    // FoodChipWidget(
                    // foodName: 'Garlic',
                    // ),
                    // FoodChipWidget(
                    // foodName: 'Sweet Potato',
                    // ),
                    // FoodChipWidget(
                    // foodName: 'Potato',
                    // ),
                    // ],
                    // ),
                    // ),
                    // ),
                    // ),
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodChipWidget extends StatefulWidget {
  final String foodName;

  const FoodChipWidget({required this.foodName});

  @override
  _FoodChipWidgetState createState() => _FoodChipWidgetState();
}

class _FoodChipWidgetState extends State<FoodChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.foodName),
      selected: _isSelected,
      selectedColor: Colors.green[400],
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          print('is selected is:');
          print(isSelected);
        });
      },
    );
  }
}

void doNothing(BuildContext context) {}

void MakeAddFoodRequest() {
  // var url = Uri.http("dev.foodie.com/addFood", "/addFood");
  // var response = await http.get(url);
}

Future<FoodItems> fetchDefaultFoodItems() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

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
  List<String> FridgeItems = ["apple", "pear", "chicken"];
  List<String> FreezerItems = ["chicken", "ice cream", "peas"];
  List<String> CupboardItems = ["onions", "potatoes", "garlic"];

  FoodItems({
    required this.FridgeItems,
    required this.FreezerItems,
    required this.CupboardItems,
  });

  factory FoodItems.fromJson(Map<String, dynamic> json) {
    return FoodItems(
      FridgeItems: json['fridgeItems'],
      FreezerItems: json['freezerItems'],
      CupboardItems: json['cupboardItems'],
    );
  }
}
