import 'package:flutter/material.dart';

class FontFamily {
  static final poppins = 'Poppins';
}

class PStyle {
  static TextStyle? poppins(BuildContext context) =>
      Theme.of(context).textTheme.displayMedium?.copyWith(
            fontFamily: FontFamily.poppins,
          );
}
