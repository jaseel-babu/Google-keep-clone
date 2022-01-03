import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keepsample/model/notes.dart';

CollectionReference notesCollection =
    FirebaseFirestore.instance.collection("notes");
final notesmodel = NotesModel();
storefirestore(String title, String notes) async {
  notesmodel.title = title;
  notesmodel.notes = notes;
  return 
  await notesCollection.add(notesmodel.toMap());
}

List<NotesModel> todoFromFirestore(QuerySnapshot snapshot) {
  
      return snapshot.docs.map((e) {
        return NotesModel(
        
          title: (e.data()as dynamic)["title"],
          notes: (e.data()as dynamic)["notes"],
          uid: e.id,
        );
      }).toList();

  }

listTodos() {

  return notesCollection.snapshots().map(todoFromFirestore);
}
