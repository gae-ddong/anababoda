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
  if (walklog > 10000){
    result = 1;
  }

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
  for (int i = 0; i < (7 - num); i++) {
    rest = checkdate % 2;
    checkdate = checkdate ~/ 2;
  }
  return rest;
}

bool costCounting(String cost) {
  // 숫자 사이의 쉼표 제거
  String cleanedCost = cost.replaceAll(',', '');

  RegExp regExp = RegExp(r'\d+');
  Iterable<Match> matches = regExp.allMatches(cleanedCost);
  int largestNumber = 0; // 가장 큰 숫자를 저장할 변수 초기화

  matches.forEach((match) {
    String? num = match.group(0);
    int parsedNum = int.parse(num!);
    if (parsedNum > largestNumber) {
      largestNumber = parsedNum; // 현재 추출한 숫자가 가장 큰 숫자라면 업데이트
    }
  });

  if (largestNumber > 50000) {
    return true;
  } else {
    return false;
  }
}

bool? checkDate(DateTime time) {
  final today = DateTime.now();

  if (today.difference(time).inDays > 1) return true;

  return false;
}

int absDate(
  DateTime currDate,
  DateTime startDate,
) {
  Duration difference = currDate.difference(startDate).abs();
  return difference.inDays;
}

int updateDatetime(int num) {
  int sum = 1;

  for (int i = 0; i < 6 - num; i++) {
    sum = sum * 2;
  }
  return sum;
}

int add(
  int abs,
  int k,
) {
  return abs + k;
}

bool checkSeven(DateTime exstartdate, DateTime getCurrentTimestamp) {
  final today = DateTime.now();
  bool result = false;
  if (today.difference(exstartdate).inDays >= 7) {
    result = true;
  }
  return result;
}

DateTime updateStartdate(
  DateTime exStartdate,
  bool checkSeven,
) {
  final today = DateTime.now();

  if (checkSeven == false) {
    return today;
  } else {
    return exStartdate;
  }
}

int updateDateCheck(
  int dateCheck,
  bool checkSeven,
) {
  final today = DateTime.now();

  if (checkSeven == false) {
    dateCheck = 0;
  }

  return dateCheck;
}
