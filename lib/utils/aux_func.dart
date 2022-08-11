import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String? validatePassword(String? value) {
  return value == null || value.isEmpty ? 'Invalid password' : null;
}

String? validateEmail(String? value) {
  const String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  final RegExp regex = RegExp(pattern);
  if (value == null || !regex.hasMatch(value)) {
    return 'Not a valid email.';
  } else {
    return null;
  }
}

showToastMessage(String message, {bool isError = false}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: isError ? Colors.red : Colors.green);
}
