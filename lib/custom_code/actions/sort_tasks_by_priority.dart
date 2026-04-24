// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future sortTasksByPriority(List<TaskDataRecord>? tasks) async {
  final sorted = List<TaskDataRecord>.from(tasks);

  sorted.sort((a, b) {
    // 1. Higher priority first (2=High, 1=Medium, 0=Low)
    final priorityCompare = b.priority.compareTo(a.priority);
    if (priorityCompare != 0) return priorityCompare;

    // 2. Earlier due date first; tasks with no due date go last
    final aDate = a.dueDate;
    final bDate = b.dueDate;
    if (aDate == null && bDate == null) return 0;
    if (aDate == null) return 1;
    if (bDate == null) return -1;
    return aDate.compareTo(bDate);
  });

  return sorted;
}
