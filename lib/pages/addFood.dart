import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart';

class AddFood extends StatefulWidget {
  AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  int? _addSlide = 0;

  // bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                    child:  CloseButton(
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
                },
                groupValue: _addSlide,
                onValueChanged: (int? newValue) {
                  setState(() {
                    _addSlide = newValue;
                  });
                },
              ),
              // ChoiceChip(label: Text('Choice Chip'), selected: _isSelected, onSelected: (newBoolValue) {
              //   setState(() {
              //     _isSelected = newBoolValue;
              //   });
              // },
              // ),
              SizedBox(height: 8),
              Column(
                children: [
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
                              foodName: 'Apple',
                            ),
                            FoodChipWidget(
                              foodName: 'Pear',
                            ),
                            FoodChipWidget(
                              foodName: 'Potato',
                            ),
                            FoodChipWidget(
                              foodName: 'Chicken',
                            ),
                            FoodChipWidget(
                              foodName: 'Courgette',
                            ),
                          ],
                        ),
                      ),
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
                ],
              )
              // Expanded(
              //   child: ListView.builder(
              //     // itemCount: items.length,
              //     itemBuilder: (BuildContext ctx, int index) {
              //       return Container(
              //         margin: EdgeInsets.all(20),
              //         height: 90,
              //           child: Row(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               // ClipRRect(
              //               //     borderRadius: BorderRadius.circular(20),
              //               //     child: Image.asset(
              //               //       'lib/images/' + items[index].name + '.png',
              //               //       fit: BoxFit.cover,
              //               //     )),
              //               // SizedBox(
              //               //   width: 0,
              //               // ),
              //               // Text(
              //               //   '',
              //               //   style: GoogleFonts.lato(
              //               //     fontSize: 20,
              //               //     color: Colors.black,
              //               //     fontWeight: FontWeight.w700,
              //               //   ),
              //               // ),
              //               SizedBox(
              //                 width: 20,
              //               ),
              //               Text(
              //                   'start adding',
              //                   style: TextStyle(
              //                     fontSize: 20,
              //                   )),
              //             ],
              //           ),
              //       );
              //     },
              //   ),
              // )
            ],
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
