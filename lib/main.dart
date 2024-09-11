import 'package:flutter/material.dart';
import 'package:demo_flutter/di.dart';
import 'package:demo_flutter/core/app_theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/home/presentation/screens/home_screen.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightAppTheme,
      home: const MyHomePage(title: 'Home page',),
    );
  }
}
