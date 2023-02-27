import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie/profile/presentation/profile.dart';
import 'package:foodie/recipe/presentation/recipe.dart';
import 'package:foodie/savings/presentation/savings.dart';
import 'package:foodie/settings/presentation/settings.dart';
import 'package:flutter/material.dart';
import '../components/model/todo.dart';
import '../food/models/item_model.dart';
import '../food/models/utils.dart';
import '../food/presentation/food.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List<Item> items = Utils.getMockedItems();
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  get itemBuilder => null;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      print('index is');
      print(index);
      currentIndex = index;
    });
  }

  int currentIndex = 0;

  final screens = [
    Food(),
    Recipe(),
    Savings(),
  ];

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const SettingsPage()),
        //     );
        //   },
        //   icon: Icon(Icons.menu, size: 30),
        //   color: Colors.black,
        // ),
        IconButton(onPressed: () { Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        }, icon: Icon(Icons.person_outline, size: 30), color: Colors.black),
        Text(screens[currentIndex].toString()),
        IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          },
          icon: Icon(Icons.settings, size: 30), color: Colors.black,),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: buildAppBar(),
          body: screens[currentIndex],
          // Container(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(top: 20, bottom: 10),
          //         child: Text(
          //           'What do you have?',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             fontSize: 30,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.black87,
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: ListView.builder(
          //           itemCount: items.length,
          //           itemBuilder: (BuildContext ctx, int index) {
          //             return Container(
          //               margin: EdgeInsets.all(20),
          //               height: 90,
          //               child: Slidable(
          //                 key: const ValueKey(0),
          //                 startActionPane: ActionPane(
          //                   // A motion is a widget used to control how the pane animates.
          //                   motion: const ScrollMotion(),
          //                   // A pane can dismiss the Slidable.
          //                   dismissible: DismissiblePane(onDismissed: () {}),
          //                   // All actions are defined in the children parameter.
          //                   children: const [
          //                     // A SlidableAction can have an icon and/or a label.
          //                     SlidableAction(
          //                       onPressed: doNothing,
          //                       backgroundColor: Color(0xFFFE4A49),
          //                       foregroundColor: Colors.white,
          //                       icon: Icons.delete,
          //                       label: 'Delete',
          //                     ),
          //                   ],
          //                 ),
          //                 endActionPane: const ActionPane(
          //                   motion: ScrollMotion(),
          //                   children: [
          //                     SlidableAction(
          //                       onPressed: doNothing,
          //                       backgroundColor: Color(0xFF0392CF),
          //                       foregroundColor: Colors.white,
          //                       icon: Icons.edit,
          //                       label: 'Edit',
          //                     ),
          //                   ],
          //                 ),
          //                 child: Row(
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     ClipRRect(
          //                         borderRadius: BorderRadius.circular(20),
          //                         child: Image.asset(
          //                           'lib/images/' + items[index].name + '.png',
          //                           fit: BoxFit.cover,
          //                         )),
          //                     SizedBox(
          //                       width: 0,
          //                     ),
          //                     Text(
          //                       items[index].name.capitalize!,
          //                       style: GoogleFonts.lato(
          //                         fontSize: 20,
          //                         color: Colors.black,
          //                         fontWeight: FontWeight.w700,
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       width: 20,
          //                     ),
          //                     Text(
          //                         items[index].daysUntilExpiry.toString() +
          //                             ' days',
          //                         style: TextStyle(
          //                           fontSize: 20,
          //                         )),
          //                     // Column(
          //                     // mainAxisSize: MainAxisSize.min,
          //                     // mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                     // crossAxisAlignment: CrossAxisAlignment.start,
          //                     // verticalDirection: VerticalDirection.up,
          //                     // children: [
          //                     //   ClipRRect(
          //                     //             borderRadius: BorderRadius.circular(20),
          //                     //             child: Image.asset('lib/images/' + items[index].name + '.png',
          //                     //       fit: BoxFit.cover,
          //                     //     )),
          //                     // ],
          //                     // ),
          //                     // Positioned.fill(
          //                     //     child: ClipRRect(
          //                     //         borderRadius: BorderRadius.circular(20),
          //                     //         child: Image.asset('lib/images/' + items[index].name + '.png',
          //                     //   // fit: BoxFit.cover,
          //                     // ))),
          //                     // Positioned(
          //                     //     bottom: 0,
          //                     //     left: 0,
          //                     //     right: 0,
          //                     //     child: Container(
          //                     //       height: 120,
          //                     //       decoration: BoxDecoration(
          //                     //           borderRadius: BorderRadius.only(
          //                     //             bottomLeft: Radius.circular(20),
          //                     //             bottomRight: Radius.circular(20),
          //                     //           ),
          //                     //         gradient: LinearGradient(
          //                     //           begin: Alignment.bottomCenter,
          //                     //           end: Alignment.topCenter,
          //                     //           colors: [
          //                     //             Colors.black.withOpacity(0.7),
          //                     //             Colors.transparent,
          //                     //           ]
          //                     //         )
          //                     //       ),
          //                     //     ),
          //                     // ),
          //                     // Row(
          //                     //   children: [
          //                     //     Container(
          //                     //       child: IconFont(
          //                     //         color: Colors.white,
          //                     //         iconName: items[index].name
          //                     //       ),
          //                     //     )
          //                     //   ],
          //                     // ),
          //                   ],
          //                 ),
          //               ),
          //             );
          //           },
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // floatingActionButton: FloatingActionButton(
          //   hoverColor: Colors.green[400],
          //   focusColor: Colors.green[100],
          //   hoverElevation: 20,
          //   elevation: 20,
          //   foregroundColor: Colors.green,
          //   backgroundColor: Colors.green,
          //   tooltip: 'Add an item',
          //   onPressed: () {},
          //   child: Text(
          //     '+',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontSize: 25,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            // onTap: _onItemTapped,
            onTap: (index) => setState(() => currentIndex = index),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.fastfood_outlined),
                label: 'Food',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.food_bank),
                label: 'Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_rounded),
                label: 'Savings',
              ),
            ],
            selectedItemColor: Colors.green[800],
            unselectedItemColor: Colors.black87,
            // backgroundColor: Colors.black87,
            // fixedColor: Colors.black87,
          )),
    );
  }
}

void doNothing(BuildContext context) {}