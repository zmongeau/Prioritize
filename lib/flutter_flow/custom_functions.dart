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
      return Color(0xFF4CAF50); // your Low color
    case 1:
      return Color(0xFFFF9800); // your Medium color
    case 2:
      return Color(0xFFF44336); // your High color
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
