import 'package:flutter/material.dart';
import 'package:untitled2/core/utils/size_config.dart';

import '../../../home/presenation/home_view.dart';

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
      duration: Duration(seconds: 1),
    );

    fadingAnimation = Tween<Offset>(
      begin: Offset(0, 4),
      end: Offset.zero,
    ).animate(animatedController);

    animatedController.forward();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    });

    fadingAnimation = Tween<Offset>(
      begin: Offset(0, 4),
      end: Offset.zero,
    ).animate(animatedController);

    animatedController.forward();
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
        Spacer(),
        AnimatedBuilder(
          animation: fadingAnimation,
          builder: (context, child) {
            return SlideTransition(position: fadingAnimation, child: child);
          },
          child: Text(
            'Fruit Market',
            textAlign: TextAlign.center,
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
            ),
            style: TextStyle(
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
