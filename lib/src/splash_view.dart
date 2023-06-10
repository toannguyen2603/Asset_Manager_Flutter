import 'dart:async';
import 'package:asset_manager_flutter/src/screens/authentication/view/sign_in/sign_in_view.dart';
import 'package:asset_manager_flutter/src/screens/scan/view/scan_view.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/utils/session_manager.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import 'constaints/type_defs/type_defs.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SessionManager session = SessionManager();
  UserId? id;

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  Future<void> isLogin() async {
    await session.getUserId().then((value) => id = value);
    if (id != null) {
      _navigateToScan();
    } else {
      _navigateToLogin();
    }
  }

  _navigateToScan() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ScannerView()),
        ((route) => false),
      );
    });
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInView()),
        ((route) => false),
      );
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
