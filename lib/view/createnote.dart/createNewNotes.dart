import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keepsample/controller/services/database_services.dart';
import 'package:keepsample/model/notes.dart';
import 'package:intl/intl.dart';

class CreateNewNotes extends StatefulWidget {
  String? title;
  String? notes;
  String? uid;
  CreateNewNotes({Key? key, this.title, this.notes, this.uid})
      : super(key: key);

  @override
  State<CreateNewNotes> createState() => _CreateNewNotesState();
}

class _CreateNewNotesState extends State<CreateNewNotes> {
  TextEditingController titleControlletr = TextEditingController();
  String? titlevalue="";
  String? currenttime;
  String? notesvalue="";
  String? userid;
  TextEditingController noteControlletr = TextEditingController();
  @override
  void dispose() {
    if (titlevalue != "" || notesvalue != "") {
      controller.edited == true
          ? editfirestore(titlevalue!, notesvalue!, userid!)
          : storefirestore(titlevalue!, notesvalue!);
      print(controller.edited);
    }
    controller.edited = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userid = widget.uid;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notification_add_outlined),
            )
          ],
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.title,
                onChanged: (value) {
                  titlevalue = value;
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Title",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white70, fontSize: 20)),
              ),
              TextFormField(
                initialValue: widget.notes,
                onChanged: (value) {
                  notesvalue = value;
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Note",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white70, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
