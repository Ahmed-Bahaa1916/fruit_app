import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Features/splash/presentation/splash_view.dart';

void main() {
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (GetMaterialApp(
      theme: ThemeData(fontFamily: 'assets/fonts/Poppins-Regular.ttf'),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    ));
  }
}

// layoutBuilder
