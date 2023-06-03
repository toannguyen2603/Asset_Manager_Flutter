import 'package:asset_manager_flutter/src/screens/asset/view/property_view.dart';
import 'package:asset_manager_flutter/src/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: PropertyScreen(),
    );
  }
}
