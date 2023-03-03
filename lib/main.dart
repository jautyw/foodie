import 'package:flutter/material.dart';
import 'package:foodie/routes.dart';
import 'package:foodie/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';
import 'package:auto_route/auto_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: "food",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: getRoutes('/authpage'),
      // routes: getRoutes(),
      // routerDelegate: _router.delegate(),
      // routeInformationParser: _router.defaultRouteParser(),
      // home: LoginPage(),
      home: AuthPage(),
      // theme: _buildTheme(Brightness.dark),
      // onGenerateRoute: AppRouter.generateRoute,
    );
  }

  // ThemeData _buildTheme(brightness) {
  //   var baseTheme = ThemeData(brightness: brightness);
  //
  //   return baseTheme.copyWith(
  //     textTheme: GoogleFonts.latoTextTheme(),
  //   );
  // }
}