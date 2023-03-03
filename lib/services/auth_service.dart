import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie/services/firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // google sign in
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn(clientId: DefaultFirebaseOptions.currentPlatform.iosClientId).signIn();
    // final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    // // finally sign in
    // try {
    //   await FirebaseAuth.instance.signInWithCredential(
    //       credential
    //   );
    //   Navigator.pop(context);
    // } on FirebaseAuthException catch (e){
    //   print('e.code is');
    //   print(e.code);
    // }
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // signInWithApple() async {
  //   // begin interactive sign in process
  //   // final GoogleSignInAccount? gUser = await GoogleSignIn(clientId: DefaultFirebaseOptions.currentPlatform.iosClientId).signIn();
  //   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  //
  //   // obtain auth details from request
  //   final GoogleSignInAuthentication gAuth = await gUser!.authentication;
  //
  //   // create a new credential for user
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: gAuth.accessToken,
  //       idToken: gAuth.idToken
  //   );
  //
  //   // finally sign in
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}