import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key}) : super(key: key);

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
          children: const [
            Icon(
              Icons.view_column_outlined,
              color: Colors.white70,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.person,
              color: Colors.white70,
            )
          ],
        ),
      ),
    );
    ;
  }
}
