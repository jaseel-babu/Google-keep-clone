import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keepsample/controller/navigationController.dart';
import 'package:keepsample/model/userModel.dart';

class MenuBar extends StatelessWidget {
   MenuBar({Key? key}) : super(key: key);
final controller = Get.put(Controller());
UserModel usermodel = UserModel();
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
    const        Icon(
              Icons.view_column_outlined,
              color: Colors.white70,
            ),
      const      SizedBox(
              width: 10,
            ),
           GetBuilder<Controller>(

             builder: (controller) {
               return CircleAvatar(backgroundImage:controller.usermodel.imageurl==null?null:
               NetworkImage(controller.usermodel.imageurl!),);
             }
           )
          ],
        ),
      ),
    );
  }
}
