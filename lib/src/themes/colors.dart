import 'package:flutter/material.dart';

class AColors {
  static const primaryColor = Color(0XFF298DCA);
  static const secondColor = Color(0XFFFBCB8A);
  static const background = Color(0xFFF2F3F8);
  static const lightGrey = Color(0XFFadadad);
  static const greenColor = Color(0XFF228B22);
  static const white = Color(0xFFFFFFFF);
  

  static const textColor = Color(0XFF0C0B09);
  static const darkText = Color(0xFF253840);
  static const lightText = Color(0xFF4A6572);

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0XFFEBEBF4),
      Color(0XFFF4F4F4),
      Color(0XFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static const splashGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomRight,
      colors: [
        Color(0XFF7AD7F0),
        Color(0XFF92DFF3),
        Color(0XFFB7E9F7),
        Color(0XFFDBF3FA),
      ]);
  static const loading = Color(0XFFCACBD6);
}
