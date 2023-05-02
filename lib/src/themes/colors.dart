import 'package:flutter/material.dart';

class PColors {
  static const primaryColor = Color(0XFF5FC6DC);
  static const secondColor = Color(0XFFFBCB8A);
  static const textColor = Color(0XFF0C0B09);
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
