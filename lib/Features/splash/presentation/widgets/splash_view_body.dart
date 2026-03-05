import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled2/core/utils/size_config.dart';

import '../../../home/presenation/home_view.dart';
import '../../../login/presentation/login_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;
  late Animation<Offset> fadingAnimation;

  @override
  void initState() {
    super.initState();

    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    fadingAnimation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: Offset.zero,
    ).animate(animatedController);

    animatedController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      final bool isLoggedIn = FirebaseAuth.instance.currentUser != null;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isLoggedIn ? const HomeView() : const LoginView(),
        ),
      );
    });
  }

  @override
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        const Spacer(),
        AnimatedBuilder(
          animation: fadingAnimation,
          builder: (context, child) {
            return SlideTransition(position: fadingAnimation, child: child);
          },
          child: Text(
            'Fruit Market',
            textAlign: TextAlign.center,
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 51,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Image.asset('assets/images/splash_view_image.png'),
      ],
    );
  }
}
