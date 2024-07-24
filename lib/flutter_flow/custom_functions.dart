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

double returncartprice(double value) {
  return value * -1;
}

List<bool>? createBooleanListFromOtherListLengh(List<String>? somethingList) {
  //List<dynamic> originalList = [1, 2, 3, 4, 5];
  List<bool> booleanList = List<bool>.filled(somethingList!.length, false);

  //print(booleanList); // Output: [false, false, false, false, false]
  return booleanList;
}
