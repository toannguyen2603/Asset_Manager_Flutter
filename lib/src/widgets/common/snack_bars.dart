import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../router/app_routes.dart';

class ASnackBar {
  static BuildContext get _context => ACoordinator.context;
  static ColorScheme get _colorScheme => Theme.of(_context).colorScheme;
  static TextTheme get _textTheme => Theme.of(_context).textTheme;
  static TextStyle? get _textStyle => _textTheme.labelLarge;

  static SnackBar failure({required String errorMessage}) => SnackBar(
        backgroundColor: _colorScheme.error,
        content: Text(
          errorMessage,
          style: _textStyle?.copyWith(
            color: _colorScheme.onError,
          ),
        ),
        duration: const Duration(milliseconds: 1000),
      );
  static SnackBar success({required String content}) => SnackBar(
        content: Text(
          content,
          style: _textStyle?.copyWith(color: _colorScheme.onPrimary),
        ),
      );

  static SnackBar warning({required String content}) => SnackBar(
        closeIconColor: _colorScheme.onErrorContainer,
        backgroundColor: _colorScheme.errorContainer,
        content: Text(
          content,
          style: _textTheme.bodyMedium?.copyWith(
            color: _colorScheme.onErrorContainer,
          ),
        ),
      );
}
