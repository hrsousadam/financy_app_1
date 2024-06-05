import 'dart:developer';
import 'package:financy_app/common/constanst/app_colors.dart';
import 'package:financy_app/common/constanst/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class OnbordingPage extends StatelessWidget {
  const OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Align(
        child: Column(
          children: [
            const SizedBox(height: 60.0),
            Image.asset('assets/images/man.png'),
            Text(
              'Spend Smarter',
              style: AppTextStyle.mediumText.copyWith(
                color: AppColors.greenLightTwo,
              ),
            ),
            Text(
              'Save More',
              style: AppTextStyle.mediumText.copyWith(
                color: AppColors.greenLightTwo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                top: 16.0,
                bottom: 4.0,
              ),
              child: PrimaryButton(
                text: 'Get Started',
                onPressed: () {},
              ),
            ),
            MultiTextButton(
              onPressed: () => log('tap on Log In button'),
              children: [
                Text(
                  'Already have an account? ',
                  style: AppTextStyle.smallText.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  'Log In',
                  style: AppTextStyle.smallText.copyWith(
                    color: AppColors.greenLightTwo,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
