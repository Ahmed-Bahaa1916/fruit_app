import 'package:flutter/material.dart';
import 'package:untitled2/Features/splash/presentation/widgets/splash_view_body.dart';

import '../../../core/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(backgroundColor: KprimaryColor, body: SplashViewBody()));
  }
}
