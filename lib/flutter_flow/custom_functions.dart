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

double? walkCal(double walklog) {
  double result = walklog / 10000;

  return result;
}

DateTime subDate() {
  final today = DateTime.now();
  final date = today.subtract(const Duration(days: 1));
  return date;
}

int totalcost(int footprint) {
  int result = 12500 - footprint;
  return result;
}

int checkAttendance(
  int checkdate,
  int num,
) {
  int rest = 0;
  for (int i = 0; i <= (7 - num); i++) {
    rest = checkdate % 2;
    checkdate = checkdate ~/ 2;
  }
  return rest;
}

bool costCounting(String cost) {
  List<String> parts = cost.split(', ');

  List<num?> numbers = parts
      .map((String part) {
        try {
          return num.parse(part);
        } catch (e) {
          // If parsing fails, return null
          return null;
        }
      })
      .where((num? number) => number != null)
      .toList(); // Filtering out nulls

  num? maxValue;

  if (numbers.isEmpty || numbers.every((element) => element == null)) {
    maxValue =
        null; // Return null if the list is empty or contains only null values
  }

  // Using reduce to find the maximum value
  maxValue = numbers.whereType<num>().reduce(
      (currentMax, number) => currentMax > number ? currentMax : number);

  if (maxValue > 1000) {
    return true;
  } else {
    return false;
  }
}
