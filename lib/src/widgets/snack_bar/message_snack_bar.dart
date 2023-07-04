import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/assets.gen.dart';

typedef ScannerQRCodeCallBack = void Function(bool status);

Future<void> showMessageSnackBar({
  required BuildContext context,
  Color? backgroundColor,
  EdgeInsets? padding,
  int duration = 1,
}) async {
  final snackBar = SnackBar(
    duration: Duration(seconds: duration),
    width: 100,
    padding: const EdgeInsets.only(bottom: 200.0),
    content: Container(
      padding: const EdgeInsets.all(5),
      height: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Lottie.asset(
        Assets.lotties.success,
        fit: BoxFit.cover,
      ),
    ),
  );
  await ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
