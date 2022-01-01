import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keepsample/controller/services/database_services.dart';
import 'package:keepsample/model/notes.dart';

class CreateNewNotes extends StatefulWidget {
  CreateNewNotes({Key? key}) : super(key: key);

  @override
  State<CreateNewNotes> createState() => _CreateNewNotesState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class _CreateNewNotesState extends State<CreateNewNotes> {
  TextEditingController titleControlletr = TextEditingController();
  // final dataservices = DatabaseServices();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController noteControlletr = TextEditingController();
  @override
  void dispose() {
    var a = readItems();
    print(a);
    // titleControlletr.text.isNotEmpty
    //     ? dataservices.createnewnote(
    //         titleControlletr.text, noteControlletr.text)
    //     : print("moonji");
    // print(dataservices.readItems());
    storefirestore(titleControlletr.text, noteControlletr.text);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              TextField(
                controller: titleControlletr,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Title",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white70, fontSize: 20)),
              ),
              TextField(
                controller: noteControlletr,
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

  storefirestore(String title, String notes) async {
    final notesmodel = NotesModel();
    notesmodel.title = title;
    notesmodel.notes = notes;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // DocumentReference documentReferencer =
    //     _mainCollection.doc(NotesModel.uid).collection('notes').doc();
    // await documentReferencer
    //     .set(notesmodel.toMap())
    //     .whenComplete(() => print("Notes item added to the database"))
    //     .catchError((e) => print(e));
    firebaseFirestore
        .collection("notes")
        .doc(NotesModel.uid)
        .set(notesmodel.toMap())
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }

  late var notsmodel = NotesModel();
  readItems() async {
    CollectionReference notesItemCollection =
        _mainCollection.doc().collection('notes');

    return notesItemCollection.snapshots();
  }
}
