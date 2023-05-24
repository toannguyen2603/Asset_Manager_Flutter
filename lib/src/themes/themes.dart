import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ATheme {
  static final _fontFamily = GoogleFonts.poppins().fontFamily;
  static const _scheme = FlexScheme.deepOrangeM3;

  static ThemeData get light => FlexThemeData.light(
        appBarElevation: 0.5,
        scheme: _scheme,
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: _fontFamily,
        subThemesData: subThemesData,
        // onPrimary: Colors.red,
        onSurface: Colors.black87,
      );

  static ThemeData get dark => FlexThemeData.dark(
        appBarElevation: 0.5,
        scheme: _scheme,
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: _fontFamily,
        subThemesData: subThemesData,
      );


  static FlexSubThemesData get subThemesData => const FlexSubThemesData(
        inputDecoratorBorderType: FlexInputBorderType.underline,
        segmentedButtonSchemeColor: SchemeColor.inversePrimary,
      );
}
