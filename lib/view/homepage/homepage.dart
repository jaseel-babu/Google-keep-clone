import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keepsample/controller/navigationController.dart';
import 'package:keepsample/view/createnote.dart/createNewNotes.dart';
import 'package:keepsample/view/homepage/widgets/archeive.dart';
import 'package:keepsample/view/homepage/widgets/create_new_label.dart';
import 'package:keepsample/view/homepage/widgets/delete.dart';
import 'package:keepsample/view/homepage/widgets/help&feedback.dart';
import 'package:keepsample/view/homepage/widgets/menubar.dart';
import 'package:keepsample/view/homepage/widgets/notes.dart';
import 'package:keepsample/view/homepage/widgets/reminder.dart';
import 'package:keepsample/view/homepage/widgets/settings.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  int currentTab = 0;
  final controller = Get.put(BottambarController());
  List screens = const [
    NotesPage(),
    ReminderPage(),
    Createlabel(),
    Archeive(),
    Delete(),
    SettingsPage(),
    HelpFeedback()
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.blueGrey[900],
          child: ListView(
            children: [
              const Text(
                "Google Keep",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              drawerlist(Icons.lightbulb_outline, "Notes", () {}),
              drawerlist(Icons.notifications_none_outlined, "Reminders", () {}),
              drawerlist(Icons.add, "Create new label", () {}),
              drawerlist(Icons.archive_outlined, "Archive", () {}),
              drawerlist(Icons.delete_outline_outlined, "Deleted", () {}),
              drawerlist(Icons.settings, "Settings", () {}),
              drawerlist(Icons.help_outline_outlined, "Help & feedback", () {}),
            ],
          ),
        ),
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
                                controller.pageChanged(ReminderPage());
                                currentTab = 1;
                              },
                              icon: const Icon(
                                Icons.check_box_sharp,
                                color: Colors.white70,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.pageChanged(ReminderPage());
                                currentTab = 2;
                              },
                              icon: const Icon(
                                Icons.brush,
                                color: Colors.white70,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.pageChanged(ReminderPage());
                                currentTab = 3;
                              },
                              icon: const Icon(
                                Icons.mic_none_sharp,
                                color: Colors.white70,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.pageChanged(ReminderPage());
                                currentTab = 4;
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

  ListTile drawerlist(IconData icon, String title, VoidCallback? pressing) {
    return ListTile(
      onTap: pressing,
      leading: Icon(
        icon,
        color: Colors.white70,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 19),
      ),
    );
  }

  navigate(int i) {}
}
