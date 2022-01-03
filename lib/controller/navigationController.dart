import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/state_manager.dart';
import 'package:keepsample/view/homepage/widgets/notes.dart';

class BottambarController extends GetxController {
  Widget currentStage = NotesPage();
  int currentTab = 0;
  pageChanged(var newPage ,int index) async {
    currentStage = newPage;
    currentTab=index;
    update();
  }
}
