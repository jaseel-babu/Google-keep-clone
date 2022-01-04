import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keepsample/controller/navigationController.dart';
import 'package:keepsample/view/consts/pages.dart';


class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key? key}) : super(key: key);
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey[900],
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ListView(
          children: [
            const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Google ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Keep',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )),
            ListView.builder(
              shrinkWrap: true,
              itemCount: draweritems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  tileColor: index == controller.currentTab
                      ? Colors.grey[700]
                      : Colors.transparent,
                  onTap: () {
                    controller.pageChanged(screens[index], index);
                    Get.back();
                  },
                  leading: Icon(
                    draweritems[index]["icon"],
                    color: index == controller.currentTab
                        ? Colors.blueAccent[100]
                        : Colors.white70,
                  ),
                  title: Text(
                    draweritems[index]["title"],
                    style: TextStyle(
                        color: index == controller.currentTab
                            ? Colors.blueAccent[100]
                            : Colors.white70,
                        fontSize: 19),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
