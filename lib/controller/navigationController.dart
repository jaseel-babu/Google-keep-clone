import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keepsample/view/homepage/widgets/notes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottambarController extends GetxController {
  Widget currentStage = NotesPage();
  bool userlogged = true;
  int currentTab = 0;
  GoogleSignInAuthentication? googleAuth;
  GoogleSignInAccount? googleUser;
  pageChanged(var newPage, int index) async {
    currentStage = newPage;
    currentTab = index;
    update();
  }

  final _auth = FirebaseAuth.instance;
  Future<UserCredential> signInWithGoogle() async {
    googleUser = await GoogleSignIn().signIn();
    googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Map<String, dynamic> tomap() {
      return {
        "id": googleUser!.id,
        "email": googleUser!.email,
        "photourl": googleUser!.photoUrl,
        "displayname": googleUser!.displayName
      };
    }

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    firebaseFirestore.collection("user").doc(googleUser!.id).set(tomap());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("userishere", true);
    update();
    print("dfs");
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
