import 'package:asset_manager_flutter/src/screens/edit/view/edit_screen.dart';
import 'package:asset_manager_flutter/src/splash_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
