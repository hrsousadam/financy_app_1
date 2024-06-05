//import 'package:financy_app/features/onboarding/onboarding_page.dart';
//import 'package:financy_app/common/constanst/app_colors.dart';
import 'package:financy_app/features/sign_up/sign_up_page.dart';
//import 'package:financy_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'common/themes/default_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: defaultTheme,
        home: const SignUpPage());
  }
}
