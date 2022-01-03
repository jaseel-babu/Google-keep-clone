import 'package:flutter/material.dart';
import 'package:keepsample/view/homepage/widgets/archeive.dart';
import 'package:keepsample/view/homepage/widgets/create_new_label.dart';
import 'package:keepsample/view/homepage/widgets/delete.dart';
import 'package:keepsample/view/homepage/widgets/help&feedback.dart';
import 'package:keepsample/view/homepage/widgets/notes.dart';
import 'package:keepsample/view/homepage/widgets/reminder.dart';
import 'package:keepsample/view/homepage/widgets/settings.dart';

List screens = const [
  NotesPage(),
  ReminderPage(),
  Createlabel(),
  Archeive(),
  Delete(),
  SettingsPage(),
  HelpFeedback()
];

List draweritems = [
  {
    'title': "Notes",
    'icon': Icons.lightbulb_outline,
  },
  {
    'title': "Reminder",
    'icon': Icons.lightbulb_outline,
  },
  {
    'title': "Create Label",
    'icon': Icons.lightbulb_outline,
  },
  {
    'title': "Archieve",
    'icon': Icons.lightbulb_outline,
  },
  {
    'title': "Delete",
    'icon': Icons.lightbulb_outline,
  },
  {
    'title': "Settings",
    'icon': Icons.lightbulb_outline,
  },
  {
    'title': "Help & Feedback",
    'icon': Icons.lightbulb_outline,
  }
];
