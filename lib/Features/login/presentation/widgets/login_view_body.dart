import 'package:flutter/material.dart';
import 'package:untitled2/core/utils/size_config.dart';

import '../complete_information/complete_information_view.dart';
import 'login_buttom.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 75),
      child: (Column(
        children: [
          SizedBox(
            height: SizeConfig.defaultSize! * 17,
            child: Image.asset('assets/images/logo.png'),
          ),
          SizedBox(height: SizeConfig.defaultSize! * 1),
          Text(
            'Fruit Market',
            style: TextStyle(
              color: Color(0XFF69A03A),
              fontSize: 51,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: LoginButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompleteInformationView(),
                        ),
                      );
                    },
                    image: 'assets/images/google-logo-png-image.png',
                    text: 'Log in with',
                  ),
                ),
              ),
              SizedBox(width: 30),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: LoginButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompleteInformationView(),
                        ),
                      );
                    },
                    image: 'assets/images/facebook-logo.png',
                    text: 'Log in with',
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
        ],
      )),
    );
  }
}
