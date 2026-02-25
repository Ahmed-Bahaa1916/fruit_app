import 'package:flutter/material.dart';

import 'custom_page_body.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        CustomPageBody(
          title: 'E Shopping',
          subTitle: 'Explore top organic fruits & grab them',
          image: 'assets/images/onboarding1.png',
        ),
        CustomPageBody(
          title: 'Delivery on the way',
          subTitle: 'Get your order by speed delivery',
          image: 'assets/images/onboarding2.png',
        ),
        CustomPageBody(
          title: 'Delivery Arrived',
          subTitle: 'Order is arrived at your place',
          image: 'assets/images/onboarding3.png',
        ),
      ],
    );
  }
}
