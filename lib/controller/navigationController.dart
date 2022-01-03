import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keepsample/view/homepage/widgets/notes.dart';

class BottambarController extends GetxController {
  Widget currentStage = NotesPage();
  int currentTab = 0;
  GoogleSignInAuthentication? googleAuth;
  GoogleSignInAccount? googleUser;
  pageChanged(var newPage, int index) async {
    currentStage = newPage;
    currentTab = index;
    update();
  }

  Future<UserCredential> signInWithGoogle() async {
    googleUser = await GoogleSignIn().signIn();
    googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Timer(Duration(seconds: 3), () {
    //
    // });
    update();
    print(googleUser!.displayName);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
