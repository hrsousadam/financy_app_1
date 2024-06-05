import 'package:flutter/material.dart';

import '../constanst/app_colors.dart';

final defaultTheme = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.greenLightTwo,
      ),
    ),
  ),
);
