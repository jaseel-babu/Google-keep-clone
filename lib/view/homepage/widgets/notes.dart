import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keepsample/model/notes.dart';
import 'package:keepsample/view/homepage/widgets/menubar.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  NotesModel notesmodel = NotesModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MenuBar(),
          ElevatedButton(
              onPressed: () async {
                FirebaseFirestore.instance
                    .collection("notes")
                    .doc(NotesModel.uid)
                    .get()
                    .then(
                  (value) async {
                    notesmodel = await NotesModel.fromMap(value.data()!);
                    setState(() {});
                  },
                );
                print(notesmodel.title);
              },
              child: Text("test"))
        ],
      ),
    );
  }
}
