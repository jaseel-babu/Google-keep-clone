import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keepsample/controller/services/database_services.dart';
import 'package:keepsample/model/notes.dart';
import 'package:keepsample/view/homepage/widgets/menubar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MenuBar(),
          StreamBuilder<List<NotesModel>>(
            stream: listTodos(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              List<NotesModel> notes = snapshot.data!.toList();
             
              return GridView.builder(shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,),
                      itemCount: notes.length,
                    


                itemBuilder: (context, index) {
                  return Card(
                    child: Text('daf'),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
