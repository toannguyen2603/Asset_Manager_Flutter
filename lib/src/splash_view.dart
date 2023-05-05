import 'dart:async';
import 'package:asset_manager_flutter/src/screens/authentication/view/sign_in/sign_in_screen.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AColors.splashGradient,
        ),
        child: Center(
          child: Text('Logo',
              style: PStyle.poppins(context)?.copyWith(
                  fontSize: 50,
                  color: AColors.textColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
