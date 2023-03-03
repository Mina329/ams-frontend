import 'package:ams_frontend/src/constants/constants.dart';
import 'package:ams_frontend/src/features/onboarding/application/onboarding_list_provider.dart';
import 'package:ams_frontend/src/features/onboarding/presentation/onboarding_controller.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'widgets/onboarding_widget.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    return Scaffold(
      body: state.when(
        data: (data) => const OnboardingPage(),
        error: (e, st) => const Text('error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingList = ref.watch(onboardingListProvider);
    final pageController = PageController();
    return Padding(
      padding: const EdgeInsets.only(bottom: KSizes.s20),
      child: PageView.builder(
        controller: pageController,
        itemCount: onboardingList.length,
        itemBuilder: (context, index) => Column(
          children: [
            OnboardingWidget(
              onboarding: onboardingList[index],
            ),
            SizedBox(
              width: KSizes.s60,
              height: KSizes.s60,
              child: ElevatedButton(
                onPressed: () {
                  if (index < onboardingList.length - 1) {
                    pageController.nextPage(
                      duration: const Duration(
                        milliseconds: KDurations.milli500,
                      ),
                      curve: Curves.ease,
                    );
                  } else {
                    ref
                        .read(onboardingControllerProvider.notifier)
                        .compeleteOnboading();
                    context.goNamed(AppRoute.login.name);
                  }
                },
                child: Icon(
                  index < onboardingList.length - 1
                      ? Icons.next_plan_outlined
                      : Icons.done_all_rounded,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
