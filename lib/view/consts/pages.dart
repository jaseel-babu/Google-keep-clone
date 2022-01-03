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
  {'title': "Reminder", 'icon': Icons.notifications_none},
  {
    'title': "Create Label",
    'icon': Icons.add,
  },
  {
    'title': "Archieve",
    'icon': Icons.archive_outlined,
  },
  {
    'title': "Delete",
    'icon': Icons.delete_outlined,
  },
  {
    'title': "Settings",
    'icon': Icons.settings,
  },
  {
    'title': "Help & Feedback",
    'icon': Icons.help_outline,
  }
];
