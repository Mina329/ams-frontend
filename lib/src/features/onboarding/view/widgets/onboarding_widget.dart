import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../model/onboarding.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key, required this.onboarding});
  final Onboarding onboarding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          Lottie.asset(onboarding.asset, height: KSizes.s50 * 6),
          const Spacer(),
          Text(
            onboarding.title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: KSizes.s20),
          Text(onboarding.text),
          const Spacer(),
        ],
      ),
    );
  }
}
