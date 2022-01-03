import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
   String? uid;
  String? title;
  String? notes;
  NotesModel({this.uid, this.title, this.notes});
  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      title: map["title"],
      notes: map['notes'],
    );
  }
  Map<String, dynamic> toMap() {
    return {"title": title, "notes": notes};
  }
}
