import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  String? uid;
  String? title;
  String? notes;
  dynamic currentTime;
  NotesModel({this.uid, this.title, this.notes,this.currentTime});
  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      title: map["title"],
      notes: map['notes'],
      currentTime: map["currenttime"]
    );
  }
  Map<String, dynamic> toMap() {
    return {"title": title, "notes": notes,"currenttime":currentTime};
  }
}
