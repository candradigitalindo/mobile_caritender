import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_mobile/blocs/auth/auth_bloc.dart';
import 'package:tender_mobile/shared/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }

          if (state is AuthFailed) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/onboarding', (route) => false);
          }
        },
        child: Center(
          child: Container(
            width: 155,
            height: 50,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/logo_caritender.png',
              ),
            )),
          ),
        ),
      ),
    );
  }
}
