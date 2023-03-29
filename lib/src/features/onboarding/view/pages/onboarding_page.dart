import 'package:ams_frontend/src/features/onboarding/providers/onboarding_provider.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/features/onboarding/providers/onboarding_list_provider.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/onboarding_widget.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    return Scaffold(
      body: state.when(
        data: (data) => const OnboardingView(),
        error: (e, st) => const Text('error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingList = ref.watch(onboardingListProvider);
    final pageController = PageController();

    ref.listen(onboardingControllerProvider, (previous, next) {
      if (next.value ?? false) {
        context.goNamed(AppRoute.login.name);
      }
    });

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
                        milliseconds: KDuration.milli500,
                      ),
                      curve: Curves.ease,
                    );
                  } else {
                    ref
                        .read(onboardingControllerProvider.notifier)
                        .compeleteOnboading();
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
