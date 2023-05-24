import 'package:flutter/material.dart';

Future<void> showSnackBar({
  required String title,
  required BuildContext context,
  Color? backgroundColor,
  EdgeInsets? padding,
  int duration = 1000,
}) async {
  final snackBar = SnackBar(
    content: Text(title),
    backgroundColor: backgroundColor,
    padding: padding,
    duration: Duration(milliseconds: duration),
  );
  await ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
