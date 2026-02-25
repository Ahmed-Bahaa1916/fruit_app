import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DotsIndecator extends StatelessWidget {
  const DotsIndecator({super.key, required this.dotIndex});

  final double dotIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dotIndex,
      decorator: DotsDecorator(
        color: Colors.black87,
        activeColor: KprimaryColor,
      ),
    );
  }
}
