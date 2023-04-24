import 'package:flutter/material.dart';

class PColors {
  static const primaryColor = Color(0x5fc6dc);
  static const secondColor = Color(0xfbcb8a);
  static const textColor = Color(0x0c0b09);
  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
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
  static const loading = Color(0xcacbd6);
}
