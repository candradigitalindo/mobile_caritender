import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tender_mobile/shared/theme.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 3),
  ).show(context);
}
