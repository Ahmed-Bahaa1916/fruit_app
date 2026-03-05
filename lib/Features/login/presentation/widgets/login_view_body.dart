import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/utils/size_config.dart';

import '../complete_information/complete_information_view.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'login_buttom.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (prev, next) => next is AuthSuccess || next is AuthFailure,
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CompleteInformationView(),
              ),
            );
          }
        },
        builder: (context, state) {
          final bool loading = state is AuthLoading;
          final String error =
              state is AuthFailure ? state.message.trim() : '';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 75),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.defaultSize! * 17,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: SizeConfig.defaultSize! * 1),
                const Text(
                  'Fruit Market',
                  style: TextStyle(
                    color: Color(0XFF69A03A),
                    fontSize: 51,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(child: SizedBox()),
                if (error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      error,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: LoginButton(
                          onPressed: loading
                              ? () {}
                              : () {
                                  context.read<AuthBloc>().add(
                                        const AuthGoogleSignInRequested(),
                                      );
                                },
                          image: 'assets/images/google-logo-png-image.png',
                          text: loading ? 'Loading...' : 'Log in with',
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: LoginButton(
                          onPressed: loading
                              ? () {}
                              : () {
                                  context.read<AuthBloc>().add(
                                        const AuthFacebookSignInRequested(),
                                      );
                                },
                          image: 'assets/images/facebook-logo.png',
                          text: loading ? 'Loading...' : 'Log in with',
                        ),
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          );
        },
      ),
    );
  }
}
