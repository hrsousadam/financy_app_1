import 'package:financy_app/common/constanst/app_colors.dart';
import 'package:financy_app/common/constanst/app_text_styles.dart';
import 'package:flutter/material.dart';

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
            const SizedBox(
              height: 60,
            ),
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/man.png'),
            ),
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
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 16.0,
              ),
              child: PrimaryButton(
                text: 'Get Started',
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Already have an account? Log in',
              style: AppTextStyle.smallText.copyWith(
                color: AppColors.grey,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
