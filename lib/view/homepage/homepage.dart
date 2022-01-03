import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keepsample/controller/navigationController.dart';
import 'package:keepsample/view/createnote.dart/createNewNotes.dart';
import 'package:keepsample/view/homepage/widgets/archeive.dart';
import 'package:keepsample/view/homepage/widgets/create_new_label.dart';
import 'package:keepsample/view/homepage/widgets/delete.dart';
import 'package:keepsample/view/homepage/widgets/drawer.dart';
import 'package:keepsample/view/homepage/widgets/help&feedback.dart';
import 'package:keepsample/view/homepage/widgets/menubar.dart';
import 'package:keepsample/view/homepage/widgets/notes.dart';
import 'package:keepsample/view/homepage/widgets/reminder.dart';
import 'package:keepsample/view/homepage/widgets/settings.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
 
  final controller = Get.put(BottambarController());

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      Scaffold(
        drawer: DrawerMenu(),
        body: GetBuilder<BottambarController>(builder: (controller) {
          return PageStorage(bucket: bucket, child: controller.currentStage);
        }),
        backgroundColor: Colors.black,
        bottomNavigationBar: GetBuilder<BottambarController>(
          builder: (controller) {
            return Stack(
              children: [
                BottomAppBar(
                  color: Colors.grey[900],
                  shape: CircularNotchedRectangle(),
                  notchMargin: 32,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                               // controller.pageChanged(ReminderPage());
                              
                              },
                              icon: const Icon(
                                Icons.check_box_sharp,
                                color: Colors.white70,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                               // controller.pageChanged(ReminderPage());
                              
                              },
                              icon: const Icon(
                                Icons.brush,
                                color: Colors.white70,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                              //  controller.pageChanged(ReminderPage());
                              
                              },
                              icon: const Icon(
                                Icons.mic_none_sharp,
                                color: Colors.white70,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                             //   controller.pageChanged(ReminderPage());
                              
                              },
                              icon: const Icon(
                                Icons.image,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      Positioned(
        bottom: 25,
        right: 10,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
          width: 70,
          height: 50,
        ),
      ),
      Positioned(
        bottom: 33,
        right: 15,
        child: GestureDetector(
          onTap: () {
            Get.to(() => CreateNewNotes());
          },
          child: Container(
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20)),
            height: 55,
            child: Container(
              height: 20,
              width: 30,
              child: Image.asset(
                "assets/images/Screenshot_from_2022-01-01_17-09-59-removebg-preview.png",
                scale: 5.0,
              ),
            ),
          ),
        ),
      ),
      // FloatingActionButton(
      //   shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //   onPressed: () {
      //     Get.to(() => CreateNewNotes());
      //   },
      //   child: const Icon(Icons.add),
      // ),
    ]);
  }

  navigate(int i) {}
}
