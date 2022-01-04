import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keepsample/controller/navigationController.dart';
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
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: GetBuilder<Controller>(builder: (controller) {
          return Column(
            children: [
              MenuBar(),
              StreamBuilder<List<NotesModel>>(
                stream: listTodos(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print("nodata");
                    return const CircularProgressIndicator();
                  }
                  controller.notes = snapshot.data!.toList();
                  print(snapshot.data);
                  return GridView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    itemCount: controller.notes.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: (direction) async{
                          if (direction == DismissDirection.startToEnd) {setState(() {
                                      controller.ondismissCards(index);
                          });
                  
   
                          }
                        },
                        key: Key(controller.notes[index].toString()),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              Text(controller.notes[index].title.toString()),
                              Text(controller.notes[index].notes.toString())
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
