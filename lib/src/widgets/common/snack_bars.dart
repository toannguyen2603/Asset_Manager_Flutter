import 'package:flutter/material.dart';

class ASnackBar {
  static SnackBar failure({required String errorMessage}) => SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          errorMessage,
          style: TextStyle(color: Colors.black),
        ),
        duration: const Duration(milliseconds: 1000),
      );
  static SnackBar success({required String content}) => SnackBar(
        backgroundColor: Colors.blue,
        content: Text(
          content,
          style: TextStyle(color: Colors.black),
        ),
        duration: const Duration(milliseconds: 1000),
      );

  static SnackBar warning({required String content}) => SnackBar(
        backgroundColor: Colors.amber,
        content: Text(
          content,
          style: TextStyle(color: Colors.black),
        ),
      );
}
