import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:keepsample/controller/navigationController.dart';
import 'package:keepsample/model/notes.dart';

final controller = Get.put(Controller());
CollectionReference notesCollection =
    FirebaseFirestore.instance.collection("user");
NotesModel notesmodel = NotesModel();
DateTime now = DateTime.now();
storefirestore(
  String title,
  String notes,
) async {
  notesmodel.title = title;
  notesmodel.notes = notes;
  notesmodel.currentTime = DateFormat('yyyy-MM-dd – kk:mm:ss').format(now);
  return controller.googleUser == null
      ? await notesCollection
          .doc(controller.usermodel.id)
          .collection("notes")
          .add(notesmodel.toMap())
      : await notesCollection
          .doc(controller.googleUser!.id)
          .collection("notes")
          .add(notesmodel.toMap());
}

editfirestore(
  String title,
  String notes,
  String uid
) async {
  notesmodel.title = title;
  notesmodel.notes = notes;
  notesmodel.currentTime = DateFormat('yyyy-MM-dd – kk:mm:ss').format(now);
  return controller.googleUser == null
      ? await notesCollection
          .doc(controller.usermodel.id)
          .collection("notes")
          .doc(uid)
          .update(notesmodel.toMap())
      : await notesCollection
          .doc(controller.googleUser!.id)
          .collection("notes")
          .doc(uid)
          .update(notesmodel.toMap());
}

deletefirestore(
 
  String uid
) async {
  
  return controller.googleUser == null
      ? await notesCollection
          .doc(controller.usermodel.id)
          .collection("notes")
          .doc(uid)
          .delete()
      : await notesCollection
          .doc(controller.googleUser!.id)
          .collection("notes")
          .doc(uid)
          .delete();
}

List<NotesModel> todoFromFirestore(QuerySnapshot snapshot) {
  return snapshot.docs.map((e) {
    return NotesModel(
      title: (e.data() as dynamic)["title"],
      notes: (e.data() as dynamic)["notes"],
      currentTime: (e.data() as dynamic)["currenttime"],
      uid: e.id,
    );
  }).toList();
}

listTodos() {
  return controller.googleUser == null
      ? notesCollection
          .doc(controller.usermodel.id)
          .collection("notes")
          .snapshots()
          .map(todoFromFirestore)
      : notesCollection
          .doc(controller.googleUser!.id)
          .collection("notes")
          .orderBy("currenttime", descending: true)
          .snapshots()
          .map(todoFromFirestore);
}
