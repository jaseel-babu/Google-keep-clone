import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keepsample/controller/navigationController.dart';
import 'package:keepsample/view/consts/pages.dart';
import 'package:keepsample/view/createnote.dart/createNewNotes.dart';
import 'package:keepsample/view/homepage/widgets/archeive.dart';
import 'package:keepsample/view/homepage/widgets/delete.dart';
import 'package:keepsample/view/homepage/widgets/help&feedback.dart';
import 'package:keepsample/view/homepage/widgets/notes.dart';
import 'package:keepsample/view/homepage/widgets/reminder.dart';
import 'package:keepsample/view/homepage/widgets/settings.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key? key}) : super(key: key);
  final controller = Get.put(BottambarController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey[900],
      child: ListView(
        children: [
          const Text(
            "Google Keep",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: draweritems.length,
            itemBuilder: (context, index) {
              return ListTile(style: ListTileStyle.drawer,
                tileColor: index == controller.currentTab
                    ? Colors.red
                    : Colors.transparent,
                onTap: () {
                  controller.pageChanged(screens[index], index);
                  Get.back();
                },
                leading: Icon(
                  draweritems[index]["icon"],
                  color: Colors.white70,
                ),
                title: Text(
                  draweritems[index]["title"],
                  style: const TextStyle(color: Colors.white, fontSize: 19),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
