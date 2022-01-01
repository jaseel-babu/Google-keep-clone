// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:keepsample/model/notes.dart';

// class DatabaseServices {
//   CollectionReference notesCollection =
//       FirebaseFirestore.instance.collection("notes");
//   createnewnote(String title, String notes) async {
//     return notesCollection.add({"title": title, "notes": notes});
//   }

//   // fetchfromFireStore(QuerySnapshot snapshot) async {
//   //   if (snapshot != null) {
//   //     return snapshot.docs.map((e) {
//   //       return NotesModel(
//   //         title: e.data()["title"],
//   //       );
//   //     });
//   //   }
//   // }

//   Stream<QuerySnapshot> readItems() {
//     CollectionReference notesItemCollection =
//         notesCollection.doc().collection('items');
    
//     return notesItemCollection.snapshots();
//   }
// }
