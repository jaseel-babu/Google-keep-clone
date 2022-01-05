import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keepsample/controller/navigationController.dart';
import 'package:keepsample/controller/services/database_services.dart';
import 'package:keepsample/model/notes.dart';
import 'package:keepsample/view/createnote.dart/createNewNotes.dart';
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
                  return GetBuilder<Controller>(
                   id: "updated",
                    builder: (controller) {
                      return ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.notes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: GetBuilder<Controller>(
                                  id: "thistile",
                                  builder: (controller) {
                                    return Dismissible(
                                      key:UniqueKey(),
                                      onDismissed: (direction) {
                                        deletefirestore(
                                            controller.notes[index].uid.toString());
                                        controller.notes.removeAt(index);
                                        controller.update(["updated"]);
                                      },
                                      child: ListTile(
                                        onTap: () {
                                          Get.to(() => CreateNewNotes(
                                                title:
                                                    controller.notes[index].title,
                                                notes:
                                                    controller.notes[index].notes,
                                                uid: controller.notes[index].uid,
                                              ));
                                          print(controller.notes[index].currentTime);
                                          controller.edited = true;
                                          controller.update(["thistile"]);
                                        },
                                        title: Text(
                                          controller.notes[index].title.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        subtitle: Text(controller.notes[index].notes
                                            .toString(), style: TextStyle(color: Colors.white),),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        },
                      );
                    }
                  );

                  // GridView.builder(
                  //   physics: ScrollPhysics(),
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   gridDelegate:
                  //       const SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           mainAxisSpacing: 5,
                  //           crossAxisSpacing: 5),
                  //   itemCount: controller.notes.length,
                  //   itemBuilder: (context, index) {
                  //     return Dismissible(
                  //       onDismissed: (direction) async {
                  //         if (direction == DismissDirection.startToEnd) {
                  //           setState(() {
                  //             controller.ondismissCards(index);
                  //           });
                  //         }
                  //       },
                  //       key: Key(controller.notes[index].toString()),
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           Get.to(() => CreateNewNotes(title: controller.notes[index].title.toString(),notes:controller.notes[index].notes.toString() ,));
                  //         },
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               color: Colors.white,
                  //               borderRadius: BorderRadius.circular(30)),
                  //           child: Column(
                  //             children: [
                  //               Text(controller.notes[index].title.toString()),
                  //               Text(controller.notes[index].notes.toString())
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
