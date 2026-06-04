import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToastUtils {
  static Future<bool?> showToastMsg({
    required String message,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}