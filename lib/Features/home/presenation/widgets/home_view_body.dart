import 'package:flutter/material.dart';
import 'package:untitled2/core/utils/size_config.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/dots_indecator.dart';
import '../../../login/presentation/login_view.dart';
import 'custom_page.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Stack(
      children: [
        CustomPage(pageController: pageController!),
        Positioned(
          right: 0,
          left: 0,
          bottom: SizeConfig.defaultSize! * 20,
          child: DotsIndecator(
            dotIndex: pageController!.hasClients
                ? pageController!.page ?? 0
                : 0,
          ),
        ),
        Visibility(
          visible: pageController!.hasClients
              ? (pageController?.page == 2 ? false : true)
              : true,
          child: Positioned(
            top: SizeConfig.defaultSize! * 10,
            right: 32,
            child: Text(
              'Skip',
              style: TextStyle(
                color: const Color(0XFF898989),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        Positioned(
          right: SizeConfig.defaultSize! * 10,
          left: SizeConfig.defaultSize! * 10,
          bottom: SizeConfig.defaultSize! * 10,
          child: CustomButton(
            text: pageController!.hasClients
                ? (pageController!.page!.round() == 2 ? 'Get Started' : 'Next')
                : 'Next',
            onPressed: () {
              if (pageController!.page!.round() == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              } else {
                pageController!.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
      ],
    ));
  }
}
