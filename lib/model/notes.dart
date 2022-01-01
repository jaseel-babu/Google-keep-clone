import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  static String? uid;
  String? title;
  String? notes;
  NotesModel({this.title, this.notes});
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
