// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie/home/home.dart';
// import 'package:foodie/routes.dart';
// import 'package:foodie/services/auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'food/presentation/workingCamera.dart';
// import 'services/firebase_options.dart';
// import 'package:auto_route/auto_route.dart';
//
// void main() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();
//
//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;
//
//   await Firebase.initializeApp(
//     // name: "food",
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp(firstCamera));
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp(this.camera, {super.key});
//
//   final CameraDescription camera;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // initialRoute: getRoutes('/authpage'),
//       routes: {
//        'itemsPage':(context) => ItemListPage(),
//        'workingCameraPage':(context) => WorkingCameraPage(camera: camera),
//       },
//       // routerDelegate: _router.delegate(),
//       // routeInformationParser: _router.defaultRouteParser(),
//       // home: LoginPage(),
//       home: AuthPage(),
//       // theme: _buildTheme(Brightness.dark),
//       // onGenerateRoute: AppRouter.generateRoute,
//     );
//   }
//
//   // ThemeData _buildTheme(brightness) {
//   //   var baseTheme = ThemeData(brightness: brightness);
//   //
//   //   return baseTheme.copyWith(
//   //     textTheme: GoogleFonts.latoTextTheme(),
//   //   );
//   // }
// }

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodie/home/home.dart';
import 'package:foodie/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'food/presentation/workingCamera.dart';
import 'services/firebase_options.dart';

void main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  await Firebase.initializeApp(
    // name: "food",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(firstCamera));
}

MaterialApp MyApp(CameraDescription firstCamera) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  // initialRoute: getRoutes('/authpage'),
  routes: {
    'itemsPage':(context) => ItemListPage(),
    '/workingCameraPage':(context) => WorkingCameraPage(camera: firstCamera),
  },
  home: AuthPage(),
  // theme: _buildTheme(Brightness.dark),
);
}

// ThemeData _buildTheme(brightness) {
//   var baseTheme = ThemeData(brightness: brightness);
//
//   return baseTheme.copyWith(
//     textTheme: GoogleFonts.latoTextTheme(),
//   );
// }
// }