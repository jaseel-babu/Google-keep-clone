import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keepsample/controller/navigationController.dart';

class MenuBar extends StatelessWidget {
   MenuBar({Key? key}) : super(key: key);
final controller = Get.put(BottambarController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey[850]),
      child: ListTile(
        leading: InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.white70,
          ),
        ),
        title: const Text(
          "Search your notes",
          style: TextStyle(color: Colors.white70),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children:  [
            Icon(
              Icons.view_column_outlined,
              color: Colors.white70,
            ),
            SizedBox(
              width: 10,
            ),
           GetBuilder<BottambarController>(

             builder: (controller) {
               return CircleAvatar(backgroundImage:controller.googleUser==null?null:
               NetworkImage(controller.googleUser!.photoUrl!),);
             }
           )
          ],
        ),
      ),
    );
  }
}
