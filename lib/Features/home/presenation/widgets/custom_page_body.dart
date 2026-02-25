import 'package:flutter/material.dart';
import 'package:untitled2/core/utils/size_config.dart';

class CustomPageBody extends StatelessWidget {
  const CustomPageBody({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        SizedBox(height: SizeConfig.defaultSize! * 22),
        SizedBox(
          height: SizeConfig.defaultSize! * 20,
          child: Image.asset(image),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 7),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: const Color(0xff2f2e41),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 2),
        Text(
          subTitle,
          style: TextStyle(
            color: const Color(0xff78787c),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),


        ),
      ],
    ));
  }
}
