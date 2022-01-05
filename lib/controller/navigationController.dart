import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keepsample/model/notes.dart';
import 'package:keepsample/model/userModel.dart';
import 'package:keepsample/view/homepage/widgets/notes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  Widget currentStage = NotesPage();
  bool userlogged = true;
  int currentTab = 0;
  bool edited = false;
  GoogleSignInAuthentication? googleAuth;
  GoogleSignInAccount? googleUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user;
  UserModel usermodel = UserModel();
  List<NotesModel> notes = [];
  List<NotesModel> archeive = [];
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
    usermodel.id = googleUser!.id;
    usermodel.email = googleUser!.email;
    usermodel.displayName = googleUser!.displayName;
    usermodel.imageurl = googleUser!.photoUrl;
    user = _auth.currentUser;
    firebaseFirestore
        .collection("user")
        .doc(googleUser!.id)
        .set(usermodel.toMap());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("userishere", true);
    prefs.setString("userid", googleUser!.id);
    update();
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  fetchuserdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString("userid");
    user = _auth.currentUser;
    userid == null
        ? null
        : await firebaseFirestore
            .collection("user")
            .doc(userid)
            .get()
            .then((value) => usermodel = UserModel.fromMap(value.data()!));

    update();
  }

  
}
