import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? priorityLabel(int? value) {
  switch (value) {
    case 0:
      return "Low";
    case 1:
      return "Medium";
    case 2:
      return "High";
    default:
      return "Unknown";
  }
}

Color? priorityColorDark(int? value) {
  switch (value) {
    case 0:
      return Color(0xFF4CAF50);
    case 1:
      return Color(0xFFFF9800);
    case 2:
      return Color(0xFFF44336);
    default:
      return Color(0xFF9E9E9E);
  }
}

Color? priorityColorLight(int? value) {
  switch (value) {
    case 0:
      return Color(0xFFE8F5E9); // light green
    case 1:
      return Color(0xFFFFF3E0); // light orange
    case 2:
      return Color(0xFFFFEBEE); // light red
    default:
      return Color(0xFFF5F5F5);
  }
}

List<DateTime> getUniqueDueDates(List<TaskDataRecord> tasks) {
  final dates = tasks
      .where((t) => t.dueDate != null)
      .map((t) => DateTime(t.dueDate!.year, t.dueDate!.month, t.dueDate!.day))
      .toSet()
      .toList();

  dates.sort((a, b) => a.compareTo(b));
  return dates;
}

double taskSortScore(
  int? priority,
  DateTime? dueDate,
) {
  final p = priority ?? 0;
  final today = DateTime.now();
  final due = dueDate ?? today;
  final days =
      due.difference(DateTime(today.year, today.month, today.day)).inDays;

  // Urgency: spikes as deadline approaches, stays high when overdue
  final urgency = days <= 0
      ? 10.0 + (-days * 2.0) // overdue: base spike + grows with how late
      : 1.0 / days.toDouble(); // future: grows exponentially as days shrinks

  return (p * 10.0) + urgency;
}

int? birthdayToAge() {
  // a function to calculate a user's age based on their birthdate in their firestore profile
  int? birthdayToAge(DateTime? birthdate) {
    if (birthdate == null) return null;
    final today = DateTime.now();
    int age = today.year - birthdate.year;
    if (today.month < birthdate.month ||
        (today.month == birthdate.month && today.day < birthdate.day)) {
      age--;
    }
    return age;
  }
}
