import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_mobile/blocs/auth/auth_bloc.dart';
import 'package:tender_mobile/views/pages/home_page.dart';
import 'package:tender_mobile/views/pages/keywords_add_page.dart';
import 'package:tender_mobile/views/pages/onboarding_page.dart';
import 'package:tender_mobile/views/pages/sign_in_page.dart';
import 'package:tender_mobile/views/pages/sign_up_page.dart';
import 'package:tender_mobile/views/pages/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthCurrentUser()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
          '/add-keywords': (context) => const KeywordsAddPage(),
        },
      ),
    );
  }
}
