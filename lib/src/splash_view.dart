import 'dart:async';
import 'package:asset_manager_flutter/src/screens/authentication/view/sign_in/sign_in_screen.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateLogin();
  }

  _navigateLogin() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AColors.splashGradient,
        ),
        child: Center(
          child: Image.asset(
            Assets.images.logo_splash.path,
            fit: BoxFit.cover,
            width: 140,
            height: 90,
          ),
        ),
      ),
    );
  }
}
