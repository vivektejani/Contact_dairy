import 'dart:io';
import 'package:flutter/material.dart';

class AppColor {
  static Color primaryColorLight = Colors.white;
  static Color secondaryColorLight = Colors.lightBlue;
  static Color primaryColorDark = Colors.black;
  static Color secondaryColorDark = Colors.lightBlue;
}

class Contact {
  final String? first_name;
  final String? last_name;
  final String? email;
  final String? phone_num;
  final File? image;

  Contact({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.phone_num,
    required this.image,
  });
}
